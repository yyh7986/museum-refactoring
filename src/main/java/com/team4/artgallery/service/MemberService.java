package com.team4.artgallery.service;

import com.team4.artgallery.dao.IMemberDao;
import com.team4.artgallery.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    IMemberDao mdao;

    public MemberVO getMember(String id) {
        return mdao.getMember(id);
    }
}
