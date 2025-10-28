/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logg")
public class Servlet1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        String gender = req.getParameter("gender");
        String course = req.getParameter("course");
        String cond = req.getParameter("cond");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        if (cond != null) {
            if (password.equals("123")) {
                out.print("<h2>Name: " + name + "</h2>");
                out.print("<h2>Email: " + email + "</h2>");
                out.print("<h2>Gender: " + gender + "</h2>");
                out.print("<h2>Course: " + course + "</h2>");
            } else {
                out.print("<h1 style='text-align:center; color:red;'>Incorrect Password</h1>");
                RequestDispatcher rd = req.getRequestDispatcher("index.html");
                rd.include(req, resp);

            }
        } else {
            out.print("<h2 style='text-align:center; color:red;'>Accept Term and Conditions</h2>");
            RequestDispatcher rd = req.getRequestDispatcher("index.html");
            rd.include(req, resp);

        }
    }

}
