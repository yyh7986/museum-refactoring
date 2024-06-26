package com.team4.artgallery.controller;

import com.team4.artgallery.service.ArtworkService;
import com.team4.artgallery.util.ArtworkCategory;
import com.team4.artgallery.vo.ArtworkVO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/artwork")
public class ArtworkController {

    @Autowired
    ArtworkService as;

    @GetMapping({"","/"})
    public ModelAndView root(HttpServletRequest request,
                             @RequestParam(value = "category", required = false) String category,
                             @RequestParam(value = "searchWord", required = false) String searchWord) {
        ModelAndView mav = new ModelAndView("artwork/artworkList");

        mav.addObject("category", category);

        List<ArtworkVO> aList = null;
        if(searchWord != null && !searchWord.isEmpty()) {
            aList = as.getArtworkBySearch(searchWord);
            mav.addObject("searchWord", searchWord);
        }else if(category == null || category.isEmpty() || category.equals("전체")){
            aList = as.getAllArtwork();
        }else{
            aList = as.getAllArtworkByCategory(category);
        }
        mav.addObject("artworkList", aList);
        return mav;
    }

    @GetMapping("/view")
    public ModelAndView view(@RequestParam("aseq") int aseq) {
        ModelAndView mav = new ModelAndView("artwork/artworkView");
        mav.addObject("artwork", as.getArtwork(aseq));
        return mav;
    }

    @GetMapping("/update")
    public String update() {
        return "artwork/artworkUpdateForm";
    }

    @GetMapping("/write")
    public String write() {
        return "artwork/artworkWriteForm";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute("artwork") @Valid ArtworkVO avo,
                        BindingResult result, Model model) {
        String url = "artwork/artworkWriteForm";
        if(result.hasErrors()) {
            result.getFieldErrors().forEach(error -> {
                model.addAttribute("message", error.getDefaultMessage());
            });

        }else{
            as.insertArtwork(avo);
            url = "/artwork";
        }
        return url;
    }

}
