package com.team4.artgallery.service;

import com.team4.artgallery.dao.IArtworkDao;
import com.team4.artgallery.vo.ArtworkVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ArtworkService{

    @Autowired
    IArtworkDao adao;

    public List<ArtworkVO> getAllArtwork() {
        return adao.getAllArtwork();
    }

    public List<ArtworkVO> getArtworkBySearch(String searchWord) {
        return adao.getArtworkBySearch(searchWord);
    }

    public List<ArtworkVO> getAllArtworkByCategory(String category) {
        return adao.getAllArtworkByCategory(category);
    }

    public ArtworkVO getArtwork(int aseq) {
        return adao.getArtwork(aseq);
    }

}
