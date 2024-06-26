package com.team4.artgallery.dao;

import com.team4.artgallery.vo.ArtworkVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IArtworkDao {

    List<ArtworkVO> getAllArtwork();

    ArtworkVO getArtwork(int aseq);

    List<ArtworkVO> getAllArtworkByCategory(String category);

    List<ArtworkVO> getArtworkBySearch(String searchWord);

    void insertArtwork(ArtworkVO avo);
}
