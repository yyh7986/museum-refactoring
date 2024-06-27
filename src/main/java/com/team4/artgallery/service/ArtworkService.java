package com.team4.artgallery.service;

import com.team4.artgallery.dao.IArtworkDao;
import com.team4.artgallery.vo.ArtworkVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void insertArtwork(ArtworkVO avo) {
        adao.insertArtwork(avo);
    }

    public List<ArtworkVO> getChcg(String category) {
        return adao.getChcg(category);
    }

    public void deleteArtwork(int aseq) {
        adao.deleteArtwork(aseq);
    }
}
