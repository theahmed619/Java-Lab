<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <%@include file="component/allcss.jsp"%>

    <!-- Custom Styles -->
    <style>
        /* Background Styling */
        .login-page {
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Center the Login Card */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 30px;
            color: white;
            max-width: 400px;
            width: 100%;
        }

        .glass-card input {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px;
        }

        .glass-card input::placeholder {
            color: #ddd;
        }

        .glass-card .btn-login {
            background: #ff4b5c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 10px;
            transition: 0.3s;
        }

        .glass-card .btn-login:hover {
            background: #ff6b7c;
        }

        .glass-card a {
            color: #ffb3c6;
            text-decoration: none;
        }

        .glass-card a:hover {
            text-decoration: underline;
        }

        .input-group-text {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
        }
    </style>
</head>

<body class="login-page">
    <!-- ✅ Navbar (Now properly aligned) -->
    <%@include file="component/navbar.jsp"%>

    <!-- Centered Login Form -->
    <div class="login-container">
        <div class="glass-card">
            <h3 class="text-center mb-3"><i class="fa fa-user-circle"></i> User Login</h3>

           <!-- Success Message -->
<c:if test="${not empty successMsg}">
    <div class="alert alert-success text-center fw-bold fs-5">
        ${successMsg}
    </div>
    <c:remove var="successMsg" scope="session" />
</c:if>

<!-- Error Message -->
<c:if test="${not empty errorMsg}">
    <div class="alert alert-danger text-center fw-bold fs-5">
        ${errorMsg}
    </div>
    <c:remove var="errorMsg" scope="session" />
</c:if>


            <!-- Login Form -->
            <form action="userLogin" method="post">
                <div class="mb-3 input-group">
                    <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                    <input name="email" type="email" placeholder="Enter Email" class="form-control" required>
                </div>

                <div class="mb-3 input-group">
                    <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    <input name="password" type="password" placeholder="Enter Password" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-login w-100">Login</button>
            </form>

            <p class="text-center mt-3">
                Don't have an account? <a href="signup.jsp">Create one</a>
            </p>
        </div>
    </div>
</body>
</html>
