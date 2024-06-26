package com.team4.artgallery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnaController {

    @GetMapping("/")
    public String root() {
        return "qna/qnaList";
    }

    @GetMapping("/view")
    public String view() {
        return "qna/qnaView";
    }

    @GetMapping("/write")
    public String write() {
        return "qna/qnaWriteForm";
    }

}
