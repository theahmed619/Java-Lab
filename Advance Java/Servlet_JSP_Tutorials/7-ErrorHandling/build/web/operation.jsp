
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operation Page</title>
    </head>
    <body>
        <%
            String num1=request.getParameter("num1");
            String num2=request.getParameter("num2");
            int c=Integer.parseInt(num1)/Integer.parseInt(num2);
            
            
        %>
        
        <%= c %>
    </body>
</html>
