/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.myservlet;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AHMED
 */

@WebServlet("/servlet2")
public class Servlet2 extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        out.print("<h1 style='color:blue'>Welcome to servlet 2</h1>");
        //url fetch
         String name=req.getParameter("user_name");
        out.print("<h1 style='color:red'>Name: "+name+"</h1>");
    }
    
}