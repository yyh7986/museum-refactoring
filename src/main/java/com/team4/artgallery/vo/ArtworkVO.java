package com.team4.artgallery.vo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ArtworkVO {

    private Integer aseq;
    @NotBlank(message = "제목을 입력하세요")
    @Size(max = 45)
    private String name;
    @NotBlank(message = "카테고리를 선택하세요")
    private String category;
    @NotBlank(message = "작가명을 입력하세요")
    @Size(max = 45)
    private String artist;
    @NotBlank(message = "제작연도를 입력하세요")
    @Size(max = 4)
    private String year;
    @NotBlank(message = "재료를 입력하세요")
    @Size(max = 45)
    private String material;
    @NotBlank(message = "규격을 입력하세요")
    @Size(max = 45)
    private String size;
    @NotBlank(message = "전시여부를 선택하세요")
    private String displayyn;
    @NotBlank(message = "내용을 입력하세요")
    private String content;
    @NotBlank(message = "이미지를 등록하세요")
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
