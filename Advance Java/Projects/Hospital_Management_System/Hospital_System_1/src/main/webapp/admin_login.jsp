<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL Tag for Conditional Rendering -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <!-- Include Bootstrap & Custom CSS -->
    <%@include file="component/allcss.jsp"%>

    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- Custom Styles -->
    <style>
        /* Fullscreen Background */
        body {
            background: url("img/admin_bg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
        }

        /* Dark Overlay */
        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        /* Glassmorphism Login Card */
        .login-card {
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            border-radius: 15px;
            padding: 25px;
            color: white;
            transition: 0.3s;
        }

        .login-card:hover {
            transform: scale(1.02);
        }

        /* Card Header */
        .card-header {
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            padding: 15px;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        /* Form Elements */
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        /* Submit Button */
        .btn-submit {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff2200);
            transform: scale(1.05);
        }

        /* Fade-in Animation */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 0.8s ease-in-out forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Admin Icon */
        .admin-icon {
            font-size: 50px;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <%@include file="component/navbar.jsp"%>

    <!-- Admin Login -->
    <div class="container d-flex justify-content-center align-items-center" style="height: 89vh;">
        <div class="col-md-4 fade-in">
            <div class="card login-card">
                <div class="card-header">
                    <i class="fas fa-user-shield admin-icon"></i> <br>
                    Admin Login
                </div>

                <div class="card-body">
                    <!-- Success Message -->
                    <c:if test="${not empty successMsg }">
                        <p class="text-center text-success fs-5">${successMsg}</p>
                        <c:remove var="successMsg" scope="session" />
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMsg }">
                        <p class="text-center text-danger fs-5">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>

                    <!-- Login Form -->
                    <form action="adminLogin" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input name="email" type="email" class="form-control" placeholder="Enter Email">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" placeholder="Enter Password">
                        </div>

                        <button type="submit" class="btn btn-submit text-white col-md-12">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
