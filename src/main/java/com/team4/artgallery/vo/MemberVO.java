package com.team4.artgallery.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class MemberVO {

    private String id;
    private String name;
    private String pwd;
    private String email;
    private Date indate;
    private String phone;
    private String adminyn;

    public boolean isAdmin() {
        return adminyn.equals("Y");
    }

    public void setAdmin(boolean isAdmin) {
        adminyn = isAdmin ? "Y" : "N";
    }
}
