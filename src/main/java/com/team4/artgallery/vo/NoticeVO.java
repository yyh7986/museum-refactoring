package com.team4.artgallery.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class NoticeVO {

    private Integer nseq;
    private String title;
    private String author;
    private Date writedate;
    private String content;
    private Integer readcount;
    private String category;
    private String image;
    private String savefilename;

}
