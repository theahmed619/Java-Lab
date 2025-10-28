<%@page import="com.hms.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Doctor</title>
    <%@include file="component/allcss.jsp"%>

    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            transition: 0.3s;
        }

        .paint-card:hover {
            transform: scale(1.05);
        }

        .search-container {
            background-color: #f0f1f2;
            padding: 20px;
            border-radius: 10px;
        }

        .search-btn {
            border-radius: 0 10px 10px 0;
            background-color: #28A745;
            color: white;
            transition: 0.3s;
        }

        .search-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <%@include file="component/navbar.jsp"%>

    <div class="container-fluid search-container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <form action="search.jsp" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" name="ch" placeholder="Search doctor..." required>
                        <button class="btn search-btn">Search</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="container p-5">
        <div class="row">
            <%
            String ch = request.getParameter("ch");
            if (ch != null && !ch.trim().isEmpty()) {
                DoctorDAO dao = new DoctorDAO(DBConnection.getConn());
                List<Doctor> list = dao.searchDoctor(ch);

                if (list.size() > 0) {
                    for (Doctor d : list) {
            %>
            <div class="col-md-3">
                <div class="card paint-card">
                    <div class="card-header text-center">
                        <i class="fa-solid fa-circle-user fa-2x"></i>
                    </div>
                    <div class="card-body">
                        <p><span class="fw-bold">Name :</span> <%= d.getFullName() %></p>
                        <p><span class="fw-bold">Specialist :</span> <%= d.getSpecialist() %></p>
                        <p><span class="fw-bold">Qualification :</span> <%= d.getQualification() %></p>
                        <p><span class="fw-bold">Email :</span> <%= d.getEmail() %></p>
                        <p><span class="fw-bold">Mob No :</span> <%= d.getPhone() %></p>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="col-12 text-center">
                <h4 class="text-danger">No doctors found! Try another search.</h4>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>

</body>
</html>
