<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.User"%>
<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Appointments</title>

    <!-- Include CSS -->
    <%@include file="../component/allcss.jsp"%>

    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- Custom Styles -->
    <style>
        /* Fullscreen Background */
        body {
            background: url("img/hospital2.jpg") no-repeat center center fixed;
            background-size: cover;
            position: relative;
            font-family: 'Poppins', sans-serif;
        }

        /* Dark Overlay */
        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        /* Glassmorphism Card */
        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            padding: 23px;
            color: white;
            width: 110%;
        }

        /* Page Title */
        .header-title {
            font-size: 35px;
            font-weight: 600;
            color: white;
            text-align: center;
            margin-top: 30px;
            text-shadow: 2px 2px 15px rgba(255, 255, 255, 0.3);
        }

        /* Table Styling */
        .custom-table {
            width: 100%;
            border-radius: 12px;
            overflow: hidden;
            color: white;
        }

        .custom-table th {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 12px;
        }

        .custom-table tr {
            transition: all 0.3s ease-in-out;
           
           
        }

        .custom-table tr:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Animated Rows */
        .custom-table tbody tr {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 0.8s ease-in-out forwards;
            
           
        }
        
           .custom-table th {
           background: linear-gradient(135deg, #4a90e2, #007bff);
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 12px;
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

        /* Status Badges */
        .badge-pending {
            background: #ffc107;
            color: black;
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
        }

        .badge-approved {
            background: #28a745;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
        }

        /* Sidebar Image */
        .sidebar-img {
            width: 100%;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
        }
        .badge-rejected {
    background: #dc3545;
    color: white;
    padding: 6px 12px;
    border-radius: 6px;
    font-weight: 500;
}

    </style>
</head>
<body>

    <%@include file="component/navbar.jsp"%>

    <!-- Redirect if user not logged in -->
    <c:if test="${empty userObj }">
        <c:redirect url="/user_login.jsp"/>
    </c:if>

    <!-- Page Title -->
    <h2 class="header-title">Your Appointments</h2>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            
         

            <!-- Appointment List -->
            <div class="col-md-9">
                <div class="glass-card">
                    <h4 class="text-center text-white mb-4"><i class="fas fa-calendar-check"></i> Appointment List</h4>

                    <!-- Appointment Table -->
                    <table class="table custom-table text-center">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Appointment Date</th>
                                <th>Phone</th>
                                <th>Diseases</th>
                                <th>Doctor</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                User user = (User) session.getAttribute("userObj");
                                DoctorDAO dDAO = new DoctorDAO(DBConnection.getConn());
                                AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                                List<Appointment> list = appDAO.getAllAppointmentByLoginUser(user.getId());

                                for (Appointment apptList : list) {
                                    Doctor doctor = dDAO.getDoctorById(apptList.getDoctorId());
                            %>

                            <tr >
                                <td ><%= apptList.getFullName() %></td>
                                <td><%= apptList.getGender() %></td>
                                <td><%= apptList.getAge() %></td>
                                <td><%= apptList.getAppointmentDate() %></td>
                                <td><%= apptList.getPhone() %></td>
                                <td><%= apptList.getDiseases() %></td>
                                <td><%= doctor.getFullName() %></td>
                               <td>
    <%
        String status = apptList.getStatus();
        if ("Pending".equalsIgnoreCase(status)) {
    %> 
        <span class="badge-pending">Pending</span> 
    <% 
        } else if ("Accept".equalsIgnoreCase(status)) {
    %> 
        <span class="badge-approved">Approved</span> 
    <% 
        } else if ("Reject".equalsIgnoreCase(status)) {
    %> 
        <span class="badge-rejected">Rejected</span> 
    <% 
        }
    %>
</td>

                            </tr>

                            <%
                                }
                            %>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
    </div>
                        <div style="margin-top: 10rem;">
                             <%@include file="component/footer.jsp"%>
                        </div>
   
</body>
</html>
