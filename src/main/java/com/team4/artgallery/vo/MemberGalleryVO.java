package com.team4.artgallery.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class MemberGalleryVO {

    private int mseq;
    private String authorId;
    private String authorName;
    private String title;
    private Date writedate;
    private String content;
    private int readcount;
    private String image;
    private String savefilename;

}
