package com.team4.artgallery.controller;

import com.team4.artgallery.service.ArtworkService;
import com.team4.artgallery.util.ArtworkCategory;
import com.team4.artgallery.vo.ArtworkVO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    public String view(@RequestParam("aseq") int aseq, Model model) {
        model.addAttribute("artwork", as.getArtwork(aseq));
        return "artwork/artworkView";
    }

    @GetMapping("/update")
    public String update() {
        return "artwork/artworkUpdateForm";
    }

    @GetMapping("/write")
    public String write() {
        return "artwork/artworkWriteForm";
    }

}
