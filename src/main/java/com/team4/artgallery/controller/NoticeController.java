package com.team4.artgallery.controller;

import com.team4.artgallery.dto.NoticeDto;
import com.team4.artgallery.enums.NoticeCategory;
import com.team4.artgallery.service.MemberService;
import com.team4.artgallery.service.NoticeService;
import com.team4.artgallery.util.Pagination;
import com.team4.artgallery.util.ajax.ResponseHelper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.experimental.Delegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class NoticeController {

    private final NoticeService noticeService;

    private final MemberService memberService;

    @Delegate
    private final ResponseHelper responseHelper;

    @GetMapping({"", "/"})
    public String list(
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "page", defaultValue = "1") int page,
            Model model
    ) {
        // 카테고리가 매거진 혹은 신문인 경우 해당 페이지로 리다이렉트
        if (NoticeCategory.매거진.name().equals(category)) {
            return "redirect:/notice/magazine";
        } else if (NoticeCategory.신문.name().equals(category)) {
            return "redirect:/notice/newspaper";
        }

        // 페이지 정보를 뷰에 전달
        Pagination pagination = new Pagination()
                .setCurrentPage(page)
                .setItemCount(noticeService.countNotices(category))
                .setUrlTemplate("/notice?page=%d" + (category == null ? "" : "&category=" + category));
        model.addAttribute("pagination", pagination);
        model.addAttribute("noticeList", noticeService.getNotices(category, pagination));
        return "notice/noticeList";
    }

    @GetMapping({"/{nseq}", "/view/{nseq}"})
    public String view(@PathVariable(value = "nseq") Integer nseq, HttpSession session, Model model) {
        // 소식지 정보를 가져올 수 없는 경우 404 페이지로 포워딩
        NoticeDto noticeDto = noticeService.getNotice(nseq);
        if (noticeDto == null) {
            return "util/404";
        }

        // 소식지를 읽은 것으로 처리
        noticeService.markAsRead(session, nseq);

        // 소식지 정보를 뷰에 전달
        model.addAttribute("noticeDto", noticeDto);
        return "notice/noticeView";
    }

    @GetMapping("/update")
    public String update(@RequestParam(value = "nseq") int nseq, HttpSession session, Model model) {
        // 관리자가 아닌 경우 404 페이지로 포워딩
        if (!memberService.isAdmin(session)) {
            return "util/404";
        }

        // 소식지 정보를 가져올 수 없는 경우 404 페이지로 포워딩
        NoticeDto noticeDto = noticeService.getNotice(nseq);
        if (noticeDto == null) {
            return "util/404";
        }

        // 소식지 정보를 뷰에 전달
        model.addAttribute("noticeDto", noticeDto);
        return "notice/noticeForm";
    }

    @PostMapping("/update")
    public ResponseEntity<?> update(@ModelAttribute NoticeDto noticeDto, HttpSession session) {
        // 관리자가 아닌 경우 요청 거부 결과 반환
        if (!memberService.isAdmin(session)) {
            return forbidden();
        }

        // 작성자를 세션 정보로부터 가져와서 소식지 정보에 설정
        noticeDto.setAuthor(memberService.getLoginMember(session).getId());

        // 소식지 수정에 실패한 경우 500 에러 반환
        if (noticeService.updateNotice(noticeDto) == 0) {
            return internalServerError("소식지 작성에 실패했습니다.");
        }

        // 소식지 수정에 성공한 경우 200 성공 반환
        return ok("소식지 수정이 완료되었습니다.", "/notice/" + noticeDto.getNseq());
    }

    @GetMapping("/write")
    public String write(HttpSession session) {
        // 관리자가 아닌 경우 404 페이지로 포워딩
        if (!memberService.isAdmin(session)) {
            return "util/404";
        }

        return "notice/noticeForm";
    }

    @PostMapping("/write")
    public ResponseEntity<?> write(@ModelAttribute NoticeDto noticeDto, HttpSession session) {
        // 관리자가 아닌 경우 요청 거부 결과 반환
        if (!memberService.isAdmin(session)) {
            return forbidden();
        }

        // 작성자를 세션 정보로부터 가져와서 소식지 정보에 설정
        noticeDto.setAuthor(memberService.getLoginMember(session).getId());

        // 소식지 작성에 실패한 경우 500 에러 반환
        if (noticeService.createNotice(noticeDto) == 0) {
            return internalServerError("소식지 작성에 실패했습니다.");
        }

        // 소식지 작성에 성공한 경우 200 성공 반환
        return ok("소식지 작성이 완료되었습니다.", "/notice/" + noticeDto.getNseq());
    }

    @PostMapping("/delete")
    public ResponseEntity<?> delete(@RequestParam(value = "nseq") int nseq, HttpSession session) {
        // 관리자가 아닌 경우 요청 거부 결과 반환
        if (!memberService.isAdmin(session)) {
            return forbidden();
        }

        // 소식지 삭제 실패 시 오류 결과 반환
        if (noticeService.deleteNotice(nseq) != 1) {
            return badRequest("소식지 삭제에 실패했습니다.");
        }

        // 소식지 삭제 성공 시 성공 결과 반환
        return ok("소식지가 삭제되었습니다.", "/notice");
    }

    @GetMapping("/magazine")
    public String magazine() {
        return "notice/noticeMagazine";
    }

    @GetMapping("/newspaper")
    public String newspaper() {
        return "notice/noticeNewspaper";
    }

}
