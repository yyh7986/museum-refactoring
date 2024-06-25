package com.team4.museum.controller.action.member.mypage;

import com.team4.museum.controller.action.Action;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static com.team4.museum.controller.action.member.LoginAjaxAction.isLogined;

public class MyPageEditFormAction implements Action {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isLogined(request, response)) {
            request.getRequestDispatcher("/WEB-INF/views/member/mypage/mypageEditForm.jsp").forward(request, response);
        }
    }

}
