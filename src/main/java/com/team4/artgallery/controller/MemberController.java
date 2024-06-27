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

import java.util.HashMap;
import java.util.Map;

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
                        @ModelAttribute @Valid MemberVO membervo,
                        BindingResult result, Model model) {
        HttpSession session = request.getSession();
        String url = "member/loginForm";
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
                url = "redirect:/";
            }
        }
        return url;
    }


    @PostMapping("/join")
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

    @GetMapping("/idcheck")
    @ResponseBody
    public Map<String, Object> idcheck(@RequestParam(value = "id", required = false) String id) {

        Map<String, Object> map = new HashMap<>();
        String message = "";
        String status = "100";
        if(id.isEmpty()){
            message = "아이디를 입력하세요";
            status = "200";
        }else if(ms.getMember(id) == null){
            message = "사용가능한 아이디입니다";
        }else{
            message = "이미 사용중인 아이디입니다";
            status = "300";
        }
        map.put("message", message);
        map.put("status", status);
        return map;
//        if(id.isEmpty()){
//            return "ERROR : id is empty";
//        }else if(ms.getMember(id) == null){
//            return "1";
//        }else{
//            return "-1";
//        }
    }
}
