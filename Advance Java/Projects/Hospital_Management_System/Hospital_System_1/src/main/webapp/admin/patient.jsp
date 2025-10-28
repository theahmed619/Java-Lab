<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL Tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Details | Admin</title>

    <%@include file="../component/allcss.jsp"%>

    <!-- Custom Styles -->
    <style>
        /* Card Styling */
        .my-card {
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            background: #fff;
            padding: 20px;
        }

        /* Title Styling */
        .page-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table Styling */
        .custom-table {
            border-radius: 8px;
            overflow: hidden;
            text-align: center;
        }

        .custom-table thead {
            background: #007bff;
            color: white;
        }

        .custom-table tbody tr:nth-child(even) {
            background: #f8f9fa;
        }

        .custom-table th, .custom-table td {
            padding: 12px;
            vertical-align: middle;
        }

        /* Status Badges */
        .badge {
            padding: 6px 12px;
            border-radius: 5px;
            font-weight: bold;
        }

        .badge-pending {
            background: #ffc107;
            color: #333;
        }

        .badge-approved {
            background: #28a745;
            color: white;
        }

        .badge-rejected {
            background: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container mt-5">
        <div class="col-md-12">
            <div class="card my-card">
                <div class="card-body">
                    <p class="page-title">Patient Details</p>

                    <!-- Table -->
                    <table class="table table-hover table-bordered custom-table">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Appointment Date</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Diseases</th>
                                <th>Doctor</th>
                                <th>Address</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                                DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                                List<Appointment> list = appDAO.getAllAppointment();
                                for (Appointment appList : list) {
                                    Doctor doctor = docDAO.getDoctorById(appList.getDoctorId());
                            %>
                            <tr>
                                <td><%= appList.getFullName() %></td>
                                <td><%= appList.getGender() %></td>
                                <td><%= appList.getAge() %></td>
                                <td><%= appList.getAppointmentDate() %></td>
                                <td><%= appList.getEmail() %></td>
                                <td><%= appList.getPhone() %></td>
                                <td><%= appList.getDiseases() %></td>
                                <td><%= doctor.getFullName() %></td>
                                <td><%= appList.getAddress() %></td>
                                <td>
                                    <% if ("Pending".equals(appList.getStatus())) { %>
                                        <span class="badge badge-pending">Pending</span>
                                    <% } else if ("Accept".equals(appList.getStatus())) { %>
                                        <span class="badge badge-approved">Approved</span>
                                    <% } else { %>
                                        <span class="badge badge-rejected">Rejected</span>
                                    <% } %>
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
</body>
</html>
