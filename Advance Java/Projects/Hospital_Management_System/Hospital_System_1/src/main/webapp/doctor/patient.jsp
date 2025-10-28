<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Details | Doctor</title>
    <%@include file="../component/allcss.jsp"%>

    <!-- Custom Styles -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .my-card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background: white;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .status-badge {
            font-size: 14px;
            font-weight: bold;
            padding: 6px 10px;
            border-radius: 20px;
        }

        .status-pending {
            background-color: #ffcc00;
            color: #333;
        }

        .status-approved {
            background-color: #28a745;
            color: white;
        }

        .btn-action {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-action i {
            margin-right: 5px;
        }

        .table-hover tbody tr:hover {
            background-color: #e9f5e9;
        }
            .status-rejected {
    background-color: #dc3545;
    color: white;
}

    </style>
</head>

<body>
    <%@include file="navbar.jsp"%>

    <!-- Redirect if Doctor is not logged in -->
    <c:if test="${empty doctorObj }">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card my-card">
                    <div class="card-body">
                        <h3 class="text-center text-success mb-3">Patient Details</h3>

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

                        <!-- Patient Table -->
                        <table class="table table-hover table-striped">
                            <thead class="table-success">
                                <tr>
                                    <th>Full Name</th>
                                    <th>Gender</th>
                                    <th>Age</th>
                                    <th>Appointment Date</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Diseases</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Doctor doctor = (Doctor) session.getAttribute("doctorObj");
                                AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                                List<Appointment> list = appDAO.getAllAppointmentByLoginDoctor(doctor.getId());
                                for (Appointment applist : list) {
                                %>
                                <tr>
                                    <td><%=applist.getFullName()%></td>
                                    <td><%=applist.getGender()%></td>
                                    <td><%=applist.getAge()%></td>
                                    <td><%=applist.getAppointmentDate()%></td>
                                    <td><%=applist.getEmail()%></td>
                                    <td><%=applist.getPhone()%></td>
                                    <td><%=applist.getDiseases()%></td>
                               <td>
    <%
    if ("Pending".equals(applist.getStatus())) {
        out.print("<span class='status-badge status-pending'>Pending</span>");
    } else if ("Accept".equalsIgnoreCase(applist.getStatus())) {
        out.print("<span class='status-badge status-approved'>Approved</span>");
    } else if ("Reject".equalsIgnoreCase(applist.getStatus())) {
        out.print("<span class='status-badge status-rejected'>Rejected</span>");
    }
    %>
</td>

                                    <td>
                                        <%
                                        if ("Pending".equals(applist.getStatus())) {
                                        %>
                                            <a href="comment.jsp?id=<%=applist.getId()%>" class="btn btn-success btn-sm btn-action">
                                                <i class="fa fa-comment"></i> Comment / Prescription
                                            </a>
                                        <%
                                        } else {
                                        %>
                                            <button class="btn btn-secondary btn-sm btn-action" disabled>
                                                <i class="fa fa-comment"></i> Commented
                                            </button>
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
                        <!-- End of Patient Table -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
