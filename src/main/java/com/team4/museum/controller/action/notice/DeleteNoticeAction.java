package com.team4.museum.controller.action.notice;

import com.team4.museum.controller.action.Action;
import com.team4.museum.dao.NoticeDao;
import com.team4.museum.util.Security;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteNoticeAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 관리자 권한이 없으면 404 페이지로 포워딩
        if (!Security.adminOr404Forward(request, response)) {
            return;
        }

        int nseq = Integer.parseInt(request.getParameter("nseq"));
        NoticeDao.getInstance().deleteNotice(nseq);

        request.getRequestDispatcher("/WEB-INF/views/notice/noticeDeleteOk.jsp").forward(request, response);
    }

}
