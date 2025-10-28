package com.cooky;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet1")
public class Servlet1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html");
       String name=req.getParameter("name");
       PrintWriter out=resp.getWriter();
       out.print("<h2>Name: "+name+"</h2>");
       
       out.println("<a href='servlet2'>Go to Servlet2</a>");
       
       //create a cookie
        Cookie ck=new Cookie("user_name", name);
        resp.addCookie(ck);
       
    }

   
   

}
