<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Login</title>

    <!-- Include CSS -->
    <%@include file="component/allcss.jsp"%>

    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- Custom Styles -->
    <style>
        /* Light Green Background */
        body {
            background: #D4EDDA; /* Light green */
            font-family: 'Poppins', sans-serif;
        }

        /* Center Login Card */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 89vh;
        }

        /* Glassmorphism Card */
        .login-card {
            background: rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 16px rgba(0, 128, 0, 0.2);
            border-radius: 15px;
            padding: 25px;
            color: black;
            max-width: 400px;
            width: 100%;
        }

        /* Card Header */
        .card-header {
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            padding: 15px;
            background: linear-gradient(135deg, #28A745, #218838);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            color: white;
        }

        /* Form Inputs */
        .form-control {
            background: rgba(255, 255, 255, 0.5);
            border: 1px solid #28A745;
            color: black;
            border-radius: 8px;
        }

        .form-control::placeholder {
            color: rgba(0, 0, 0, 0.6);
        }

        /* Submit Button */
        .btn-submit {
            background: linear-gradient(135deg, #28A745, #218838);
            border: none;
            padding: 10px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            transition: 0.3s;
            color: white;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #218838, #1E7E34);
            transform: scale(1.05);
        }

        /* Medical Icon */
        .doctor-icon {
            font-size: 50px;
            color: white;
        }
    </style>
</head>
<body>

    <!-- ✅ Navbar (Now properly aligned) -->
    <%@include file="component/navbar.jsp"%>

    <!-- Doctor Login -->
    <div class="login-container">
        <div class="login-card">
            <div class="card-header">
                <i class="fas fa-user-md doctor-icon"></i> <br>
                Doctor Login
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
                <form action="doctorLogin" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input name="email" type="email" class="form-control" placeholder="Enter Email">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input name="password" type="password" class="form-control" placeholder="Enter Password">
                    </div>

                    <button type="submit" class="btn btn-submit w-100">Login</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
