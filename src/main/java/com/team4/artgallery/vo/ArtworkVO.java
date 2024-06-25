package com.team4.artgallery.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ArtworkVO {

    private Integer aseq;
    private String name;
    private String category;
    private String artist;
    private String year;
    private String material;
    private String size;
    private String displayyn;
    private String content;
    private String image;
    private String savefilename;
    private Date indate;

    public String getFullSavefilename() {
        if (savefilename.startsWith("http")) {
            return savefilename;
        }

        return "../static/image/artwork/" + savefilename;
    }

    public boolean isDisplay() {
        return displayyn.equals("Y");
    }
}
