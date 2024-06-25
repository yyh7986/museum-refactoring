package com.team4.artgallery.controller;

import com.team4.artgallery.service.MemberService;
import com.team4.artgallery.vo.MemberVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberService ms;

    @GetMapping("/login")
    public String login() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(HttpServletRequest request,
                        @ModelAttribute MemberVO membervo, BindingResult result, Model model) {
        HttpSession session = request.getSession();
        if(result.getFieldError("id") != null){
            model.addAttribute("message", result.getFieldError("id").getDefaultMessage());
        }else if(result.getFieldError("pwd") != null){
            model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
        }else{
            MemberVO mvo = ms.getMember(membervo.getId());
            if(mvo == null){
                model.addAttribute("message", ">아이디< 혹은 비밀번호가 일치하지 않습니다");
            }else if(!mvo.getPwd().equals(membervo.getPwd())){
                model.addAttribute("message", "아이디 혹은 >비밀번호<가 일치하지 않습니다");
            }else{
                session.setAttribute("loginUser", mvo);
            }
        }
        return "redirect:/";
    }


    @GetMapping("/join")
    public String register() {
        return "member/joinForm";
    }

    @GetMapping("/contract")
    public String root() {
        return "member/contract";
    }

    @GetMapping("/withdraw")
    public String withdraw() {
        return "member/withdrawForm";
    }

    @GetMapping("/mypage")
    public String mypage() {
        return "member/mypage/mypage";
    }

    @GetMapping("/mypage/edit")
    public String edit() {
        return "member/mypage/mypageEditForm";
    }

    @GetMapping("/mypage/favorite")
    public String favorite() {
        return "member/mypage/mypageFavoriteList";
    }
}
