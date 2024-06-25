package com.team4.museum.controller.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface Action {

    void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
