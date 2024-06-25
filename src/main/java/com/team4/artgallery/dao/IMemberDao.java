package com.team4.artgallery.dao;

import com.team4.artgallery.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String id);
}
