package com.team4.artgallery.vo;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Data
public class MemberVO {

    @NotEmpty(message = "아이디를 입력하세요")
    private String id;
    @NotEmpty(message = "이름을 입력하세요")
    private String name;
    @NotEmpty(message = "비밀번호를 입력하세요")
    private String pwd;
    @NotEmpty(message = "이메일을 입력하세요")
    private String email;
    private Date indate;
    @NotEmpty(message = "전화번호를 입력하세요")
    private String phone;
    private String adminyn;

    public boolean isAdmin() {
        return adminyn.equals("Y");
    }

    public void setAdmin(boolean isAdmin) {
        adminyn = isAdmin ? "Y" : "N";
    }
}
