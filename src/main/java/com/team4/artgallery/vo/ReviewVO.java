package com.team4.artgallery.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ReviewVO {

    private Integer rseq;
    private String title;
    private String author;
    private Integer aseq;
    private Date writedate;
    private String content;

}
