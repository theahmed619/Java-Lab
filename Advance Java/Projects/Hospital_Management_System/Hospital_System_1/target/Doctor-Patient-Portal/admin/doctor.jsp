<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Registration | HMS</title>
<%@include file="../component/allcss.jsp"%>

<!-- Custom CSS -->
<style>
    .my-card {
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }
    .form-container {
        max-width: 500px;
        margin: auto;
    }
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card my-card">
					<div class="card-body">
						<h3 class="text-center text-primary mb-3">Register Doctor</h3>

						<!-- Success & Error Messages -->
						<c:if test="${not empty successMsg}">
							<div class="alert alert-success text-center fw-bold">
								${successMsg}
							</div>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger text-center fw-bold">
								${errorMsg}
							</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of Messages -->

						<!-- Bootstrap Form -->
						<form action="../addDoctor" method="post" class="form-container">
							<div class="mb-3">
								<label class="form-label fw-bold">Full Name</label>
								<input name="fullName" type="text" class="form-control" placeholder="Enter full name" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Date of Birth</label>
								<input name="dateOfBirth" type="date" class="form-control" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Qualification</label>
								<input name="qualification" type="text" class="form-control" placeholder="Enter qualification" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Specialist</label>
								<select class="form-control" name="specialist" required>
									<option disabled selected>-- Select Specialist --</option>
									<%
									SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
									List<Specialist> spList = spDAO.getAllSpecialist();
									for (Specialist sp : spList) {
									%>
									<option><%=sp.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Email Address</label>
								<input name="email" type="email" class="form-control" placeholder="Enter Email" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Phone</label>
								<input name="phone" type="text" class="form-control" placeholder="Enter mobile number" required>
							</div>

							<div class="mb-3">
								<label class="form-label fw-bold">Password</label>
								<input name="password" type="password" class="form-control" placeholder="Enter password" required>
							</div>

							<button type="submit" class="btn btn-primary w-100">Register Doctor</button>
						</form>
						<!-- End of Bootstrap Form -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
