<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
    <%@include file="../component/allcss.jsp"%>

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .dashboard-header {
            font-weight: bold;
            color: #2c6e49;
            margin-bottom: 20px;
        }

        .my-card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
            background: white;
        }

        .my-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
        }

        .card-body {
            padding: 25px;
        }

        .card-icon {
            font-size: 50px;
            color: #2c6e49;
        }

        .card-text {
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <%@include file="navbar.jsp"%>

    <!-- Redirect if Doctor is not logged in -->
    <c:if test="${empty doctorObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container mt-5">
        <h2 class="text-center dashboard-header">Doctor Dashboard</h2>

        <%
        DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
        int totalNumberOfDoctor = docDAO.countTotalDoctor();
        Doctor currentLoginDoctor = (Doctor)session.getAttribute("doctorObj");
        %>

        <div class="row justify-content-center">
            <!-- Total Doctors -->
            <div class="col-md-4">
                <div class="card my-card">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-user-doctor card-icon"></i>
                        <p class="card-text">Total Doctors</p>
                        <h3 class="text-success"><%= totalNumberOfDoctor %></h3>
                    </div>
                </div>
            </div>

            <!-- Total Appointments -->
            <div class="col-md-4">
                <div class="card my-card">
                    <div class="card-body text-center">
                        <i class="fa-solid fa-calendar-check card-icon"></i>
                        <p class="card-text">Total Appointments</p>
                        <h3 class="text-success"><%= docDAO.countTotalAppointmentByDoctorId(currentLoginDoctor.getId()) %></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
