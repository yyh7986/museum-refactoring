package com.team4.artgallery.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class QnaVO {

    private Integer qseq;
    private String title;
    private String content;
    private Date writedate;
    private String email;
    private String pwd;
    private String phone;
    private String reply;
    private String publicyn;

    public boolean isPublic() {
        return publicyn.equals("Y");
    }

    public void setPublic(boolean isPublic) {
        publicyn = isPublic ? "Y" : "N";
    }
}
