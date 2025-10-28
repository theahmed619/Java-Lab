/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cooky;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AHMED
 */
@WebServlet("/servlet2")
public class Servlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        Cookie[] cookies = req.getCookies();
        boolean f = false;
        String name = "";
        if (cookies == null) {
            out.print("<h1>you are new user go to home page and submit your name</h1>");
            return;
        } else {
            for (Cookie c : cookies) {
                String tname = c.getName();
                if (tname.equals("user_name")) {
                    f = true;
                    name = c.getValue();
                }
            }
        }
        if (f) {
            out.print("<h2>Name: " + name + "</h2>");
        } else {
            out.print("<h1>you are new user</h1>");
        }

    }

}
