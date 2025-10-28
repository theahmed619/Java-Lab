<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!-- Doctor Navbar with Light Green Theme -->
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #4CAF50;">
    <div class="container-fluid">
        <!-- Brand Logo -->
        <a class="navbar-brand text-white fw-bold fs-4" href="index.jsp">
            <i class="fa-solid fa-user-doctor"></i> Doctor Panel
        </a>

        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link text-white fw-semibold px-3" href="index.jsp">
                        <i class="fa fa-home"></i> Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white fw-semibold px-3" href="patient.jsp">
                        <i class="fa fa-wheelchair"></i> Patients
                    </a>
                </li>

                <!-- Profile Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white fw-semibold px-3" href="#" id="doctorDropdown"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-user-md"></i> ${ doctorObj.fullName }
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="doctorDropdown">
                        <li><a class="dropdown-item" href="edit_profile.jsp">
                            <i class="fa fa-user-edit"></i> Edit Profile</a></li>
                        <li><a class="dropdown-item text-danger" href="../doctorLogout">
                            <i class="fa fa-sign-out-alt"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
