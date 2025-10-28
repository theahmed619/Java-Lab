<%@page import="com.hms.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL Tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book an Appointment</title>
<!-- Include CSS -->
<%@include file="../component/allcss.jsp"%>

<style>
/* Background Image with Gradient Overlay */
.appointment-container {
    position: relative;
    width: 100%;
    min-height: 100vh;
    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                url("img/hospital1.jpg") no-repeat center center/cover;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 40px 20px;
}

/* Appointment Form Styling */
.appointment-form {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 12px;
    padding: 30px;
    width: 100%;
    max-width: 500px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

/* Form Labels & Inputs */
.appointment-form label {
    font-weight: bold;
    color: #fff;
}

.appointment-form .form-control {
    border-radius: 8px;
    padding: 10px;
    font-size: 16px;
}

.appointment-form .btn-submit {
    background: #28a745;
    border: none;
    font-size: 18px;
    padding: 10px;
    border-radius: 8px;
    transition: 0.3s;
}

.appointment-form .btn-submit:hover {
    background: #218838;
}
</style>

</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <!-- Appointment Section -->
    <div class="appointment-container">
        <div class="appointment-form">
            <h3 class="text-center text-white mb-3">Book Your Appointment</h3>

           <!-- Display Success or Error Messages -->
<c:if test="${not empty successMsg}">
    <div class="alert alert-success text-center fw-bold fs-5">
        ${successMsg}
    </div>
    <c:remove var="successMsg" scope="session" />
</c:if>

<c:if test="${not empty errorMsg}">
    <div class="alert alert-danger text-center fw-bold fs-5">
        ${errorMsg}
    </div>
    <c:remove var="errorMsg" scope="session" />
</c:if>


            <!-- Appointment Form -->
            <form action="addAppointment" method="post">
                <input type="hidden" name="userId" value="${ userObj.id }">
                
                <div class="mb-3">
                    <label>Full Name</label>
                    <input type="text" name="fullName" class="form-control" placeholder="Enter your full name" required>
                </div>

                <div class="mb-3">
                    <label>Gender</label>
                    <select class="form-control" name="gender" required>
                        <option disabled selected>-- Select Gender --</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label>Age</label>
                    <input type="number" name="age" class="form-control" placeholder="Enter your age" required>
                </div>

                <div class="mb-3">
                    <label>Appointment Date</label>
                    <input type="date" name="appointmentDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                </div>

                <div class="mb-3">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control" placeholder="Enter your phone number" required>
                </div>

                <div class="mb-3">
                    <label>Diseases</label>
                    <input type="text" name="diseases" class="form-control" placeholder="Enter any diseases" required>
                </div>

                <div class="mb-3">
                    <label>Doctor</label>
                    <select class="form-control" name="doctorNameSelect" required>
                        <option disabled selected>-- Select Doctor --</option>
                        <%
                        DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());
                        List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
                        for (Doctor d : listOfDoctor) {
                        %>
                            <option value="<%= d.getId() %>">
                                <%= d.getFullName()%> (<%= d.getSpecialist() %>)
                            </option>
                        <%
                        }
                        %>
                    </select>
                </div>

                <div class="mb-3">
                    <label>Address</label>
                    <textarea name="address" class="form-control" rows="3" placeholder="Enter your full address" required></textarea>
                </div>

                <c:if test="${empty userObj}">
                    <a href="user_login.jsp" class="btn btn-success btn-submit w-100">Submit</a>
                </c:if>

                <c:if test="${not empty userObj}">
                    <button type="submit" class="btn btn-success btn-submit w-100">Submit</button>
                </c:if>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="component/footer.jsp" %>
</body>
</html>
