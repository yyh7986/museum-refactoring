package com.team4.artgallery.service;

import com.team4.artgallery.dao.IQnaDao;
import com.team4.artgallery.dto.QnaDto;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.experimental.Delegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class QnaService {

    @Delegate
    private final IQnaDao qnaDao;

    private final MemberService memberService;

    private String hashQseq(int qseq) {
        return "qnaHash" + qseq;
    }

    /**
     * 문의글에 대한 인증 결과가 세션에 저장되어 있는지 확인합니다.
     *
     * @param session 세션 객체
     * @param qseq    문의글 번호
     * @return 인증 결과가 세션에 저장되어 있으면 true, 그렇지 않으면 false
     */
    public boolean isAuthorized(HttpSession session, int qseq) {
        return session.getAttribute(hashQseq(qseq)) != null;
    }

    /**
     * 문의글에 대한 인증을 처리합니다
     *
     * @param session 세션 객체
     * @param qseq    문의글 번호
     * @param pwd     문의글 비밀번호
     * @return 인증 성공 시 true, 실패 시 false
     */
    public boolean authorizeWithPwd(HttpSession session, int qseq, String pwd) {
        if (isAuthorized(session, qseq)) {
            return true;
        }

        QnaDto qnaDto = qnaDao.getInquiry(qseq);
        if (qnaDto == null || !qnaDto.getPwd().equals(pwd)) {
            return false;
        }

        session.setAttribute(hashQseq(qseq), true);
        return true;
    }

    /**
     * 문의글에 대한 인증을 처리합니다 (글 수정 등)
     * <p>
     * PERSONAL(개인) : 작성자만 접근 가능
     */
    public boolean authorizeForPersonal(HttpSession session, int qseq) {
        return isAuthorized(session, qseq);
    }

    /**
     * 문의글에 대한 인증을 처리합니다 (글 삭제 등)
     * <p>
     * PRIVILEGE(허가) : 작성자 및 관리자만 접근 가능
     */
    public boolean authorizeForPrivilege(HttpSession session, int qseq) {
        return authorizeForPersonal(session, qseq) || memberService.isAdmin(session);
    }

    /**
     * 문의글에 대한 인증을 처리합니다 (글 조회 등)
     * <p>
     * RESTRICT(제한) : 공개글이거나 작성자 및 관리자만 접근 가능
     */
    public boolean authorizeForRestrict(HttpSession session, int qseq) {
        return authorizeForPrivilege(session, qseq) || qnaDao.getInquiry(qseq).isPublic();
    }

}
