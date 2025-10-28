<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HMS Admin Dashboard</title>
    <%@include file="../component/allcss.jsp"%>
    <!-- Include Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Include Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    
    <!-- Custom CSS for this page -->
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #e74c3c;
            --accent-color: #3498db;
            --light-color: #ecf0f1;
            --dark-color: #34495e;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .admin-header {
            background: linear-gradient(135deg, var(--primary-color), var(--dark-color));
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .stats-card {
            background: white;
            border-radius: 10px;
            transition: all 0.3s;
            height: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        
        .stats-card .icon-area {
            font-size: 2.5rem;
            height: 80px;
            width: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin: 0 auto 15px auto;
        }
        
        .doctor-card .icon-area {
            background-color: rgba(231, 76, 60, 0.2);
            color: #e74c3c;
        }
        
        .user-card .icon-area {
            background-color: rgba(52, 152, 219, 0.2);
            color: #3498db;
        }
        
        .appointment-card .icon-area {
            background-color: rgba(46, 204, 113, 0.2);
            color: #2ecc71;
        }
        
        .specialist-card .icon-area {
            background-color: rgba(155, 89, 182, 0.2);
            color: #9b59b6;
        }
        
        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .card-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 10px 0;
            color: var(--dark-color);
        }
        
        .alert-custom {
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        .alert-success-custom {
            background-color: rgba(46, 204, 113, 0.2);
            border-left: 4px solid #2ecc71;
            color: #27ae60;
        }
        
        .alert-danger-custom {
            background-color: rgba(231, 76, 60, 0.2);
            border-left: 4px solid #e74c3c;
            color: #c0392b;
        }
        
        /* Modal styling */
        .modal-content {
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .modal-header {
            background: linear-gradient(135deg, var(--primary-color), var(--dark-color));
            color: white;
            border-radius: 15px 15px 0 0;
        }
        
        .modal-title {
            font-weight: 600;
            color: white;
        }
        
        .modal-btn {
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-custom-primary {
            background-color: var(--secondary-color);
            border: none;
            color: white;
        }
        
        .btn-custom-primary:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #ddd;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.2);
            border-color: var(--secondary-color);
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <!-- adminObj session maintain if "adminObj" empty than go and login first... -->
    <c:if test="${empty adminObj }">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <div class="container py-5">
        <div class="admin-header mb-4">
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="m-0"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</h1>
                <div class="d-flex align-items-center">
                    <div class="text-end me-3">
                        <p class="m-0 fs-5">${adminObj.fullName}</p>
                        <small>Administrator</small>
                    </div>
                    <i class="bi bi-person-circle fs-3"></i>
                </div>
            </div>
        </div>

        <!-- Messages Area -->
        <c:if test="${not empty successMsg }">
            <div class="alert alert-success-custom alert-dismissible fade show mb-4" role="alert">
                <i class="bi bi-check-circle me-2"></i> ${successMsg}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <c:remove var="successMsg" scope="session" />
            </div>
        </c:if>

        <c:if test="${not empty errorMsg }">
            <div class="alert alert-danger-custom alert-dismissible fade show mb-4" role="alert">
                <i class="bi bi-exclamation-triangle me-2"></i> ${errorMsg}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <c:remove var="errorMsg" scope="session" />
            </div>
        </c:if>

        <% 
        DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
        int totalNumberOfDoctor = docDAO.countTotalDoctor();
        int totalNumberOfUser = docDAO.countTotalUser();
        int totalNumberOfAppointment = docDAO.countTotalAppointment();
        int totalNumberOfSpecialist = docDAO.countTotalSpecialist();
        %>

        <!-- Statistics Cards -->
        <div class="row g-4">
            <!-- Doctor Card -->
            <div class="col-md-6 col-lg-3">
                <div class="stats-card doctor-card p-4 text-center">
                    <div class="icon-area">
                        <i class="fa-solid fa-user-doctor"></i>
                    </div>
                    <h5 class="card-title">Doctors</h5>
                    <h2 class="card-number"><%= totalNumberOfDoctor %></h2>
                    <p class="text-muted mb-0">Registered Physicians</p>
                </div>
            </div>
            
            <!-- User Card -->
            <div class="col-md-6 col-lg-3">
                <div class="stats-card user-card p-4 text-center">
                    <div class="icon-area">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <h5 class="card-title">Users</h5>
                    <h2 class="card-number"><%= totalNumberOfUser %></h2>
                    <p class="text-muted mb-0">Registered Patients</p>
                </div>
            </div>
            
            <!-- Appointment Card -->
            <div class="col-md-6 col-lg-3">
                <div class="stats-card appointment-card p-4 text-center">
                    <div class="icon-area">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>
                    <h5 class="card-title">Appointments</h5>
                    <h2 class="card-number"><%= totalNumberOfAppointment %></h2>
                    <p class="text-muted mb-0">Total Scheduled</p>
                </div>
            </div>
            
            <!-- Specialist Card -->
            <div class="col-md-6 col-lg-3">
                <div class="stats-card specialist-card p-4 text-center" data-bs-toggle="modal"  >
                    <div class="icon-area">
                        <i class="fa-solid fa-stethoscope"></i>
                    </div>
                    <h5 class="card-title">Specialties</h5>
                    <h2 class="card-number"><%= totalNumberOfSpecialist %></h2>
                    <p class="text-muted mb-0">Medical Specializations</p>
                </div>
            </div>
        </div>
        
        <!-- Quick Actions Section -->
        <div class="row mt-5">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white py-3">
                        <h5 class="mb-0"><i class="bi bi-lightning-charge me-2"></i>Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 col-sm-6 mb-3">
                                <a href="doctor.jsp" class="btn btn-light w-100 py-3 border">
                                    <i class="fa-solid fa-user-doctor me-2 text-danger"></i> Manage Doctors
                                </a>
                            </div>
<!--                            <div class="col-md-3 col-sm-6 mb-3">
                                <a href="view_appointment.jsp" class="btn btn-light w-100 py-3 border">
                                    <i class="fa-solid fa-calendar-check me-2 text-success"></i> View Appointments
                                </a>
                            </div>-->
                            <div class="col-md-4 col-sm-6 mb-3">
                                <a href="patient.jsp" class="btn btn-light w-100 py-3 border">
                                    <i class="fas fa-user-circle me-2 text-primary"></i> Manage Patients
                                </a>
                            </div>
                            <div class="col-md-4 col-sm-6 mb-3">
                                <button class="btn btn-light w-100 py-3 border" data-bs-toggle="modal" data-bs-target="#specialistModal">
                                    <i class="fa-solid fa-stethoscope me-2 text-purple"></i> Add Specialty
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Specialist Modal -->
    <div class="modal fade" id="specialistModal" tabindex="-1" aria-labelledby="specialistModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="specialistModalLabel">
                        <i class="fa-solid fa-stethoscope me-2"></i>Add Medical Specialty
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="../addSpecialist" method="post">
                        <div class="mb-3">
                            <label for="specialistName" class="form-label">Specialty Name</label>
                            <input type="text" class="form-control" id="specialistName" name="specialistName" 
                                   placeholder="e.g. Cardiology, Neurology, Pediatrics" required>
                        </div>
                        <div class="d-grid mt-4">
                            <button type="submit" class="btn btn-custom-primary modal-btn">
                                <i class="bi bi-plus-circle me-2"></i>Add Specialty
                            </button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>