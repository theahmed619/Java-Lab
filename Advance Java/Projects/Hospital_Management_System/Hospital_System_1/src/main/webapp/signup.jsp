<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Signup</title>

    <!-- Bootstrap CSS -->
    <%@include file="component/allcss.jsp"%>

    <!-- Custom CSS -->
    <style>
        /* Background Wrapper (Keeps Navbar Untouched) */
        .bg-wrapper {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background: linear-gradient(135deg, #2E3192, #1BFFFF);
            z-index: -1;
        }

        /* Signup Form Container */
        .signup-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 88vh;
        }

        /* Glassmorphism Card */
        .signup-card {
            width: 90%;
            max-width: 400px;
      
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 20px;
            color: white;
        }

        .signup-header {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            padding: 15px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 15px 15px 0 0;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.3);
            border: none;
            color: white;
        }

        .form-control::placeholder {
            color: white;
            opacity: 0.8;
        }

        .btn-custom {
             background: rgba(106, 245, 39, 0.8);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 10px;
            transition: 0.3s;
        }

       
    </style>
</head>
<body>

    <!-- Navbar (Fixed Properly) -->
    <%@include file="component/navbar.jsp"%>

    <!-- Background Wrapper (Does Not Affect Navbar) -->
    <div class="bg-wrapper"></div>

    <!-- Signup Form -->
    <div class="container signup-container">
        <div class="signup-card">
            <div class="signup-header">
                <i class="fa fa-user-plus"></i> User Registration
            </div>
            <div class="card-body">

                <!-- Success Message -->
                <c:if test="${not empty successMsg}">
                    <p class="text-center text-success">${successMsg}</p>
                    <c:remove var="successMsg" scope="session"/>
                </c:if>

                <!-- Error Message -->
                <c:if test="${not empty errorMsg}">
                    <p class="text-center text-danger">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session"/>
                </c:if>

                <!-- Signup Form -->
                <form action="user_register" method="post" onsubmit="return validateForm()">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input name="fullName" type="text" id="fullName" class="form-control" placeholder="Enter full name">
                        <small class="text-danger" id="nameError"></small>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input name="email" type="email" id="email" class="form-control" placeholder="Enter email">
                        <small class="text-danger" id="emailError"></small>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input name="password" type="password" id="password" class="form-control" placeholder="Enter password">
                        <small class="text-danger" id="passwordError"></small>
                    </div>
                    <button type="submit" class="btn btn-custom w-100">Register</button>
                </form>

                <p class="text-center mt-3">
                    Already have an account? <a href="user_login.jsp" class="text-decoration-none" style="color: white;">Login here</a>
                </p>

            </div>
        </div>
    </div>

    <!-- JavaScript Validation -->
    <script>
        function validateForm() {
            let isValid = true;

            let name = document.getElementById("fullName").value.trim();
            let email = document.getElementById("email").value.trim();
            let password = document.getElementById("password").value.trim();

            document.getElementById("nameError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("passwordError").textContent = "";

            if (name === "") {
                document.getElementById("nameError").textContent = "Full name is required.";
                isValid = false;
            }
            if (email === "") {
                document.getElementById("emailError").textContent = "Email is required.";
                isValid = false;
            }
            if (password.length < 6) {
                document.getElementById("passwordError").textContent = "Password must be at least 6 characters.";
                isValid = false;
            }

            return isValid;
        }
    </script>

</body>
</html>
