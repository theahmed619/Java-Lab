<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
    <div class="container-fluid d-flex align-items-center">
        
        <!-- Hospital Management System (HMS) Brand -->
        <a class="navbar-brand me-3" href="index.jsp">
            <i class="fa-sharp fa-solid fa-hospital"></i> HMS
        </a>

        <!-- Search Bar (Now Next to HMS) -->
        <form class="d-flex search-form me-auto" action="search.jsp">
            <input class="form-control search-input" type="search" placeholder="Search..." aria-label="Search">
            <button class="btn btn-light search-btn" type="submit"><i class="fas fa-search"></i></button>
        </form>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                
                <!-- Payment Button -->
                <li class="nav-item">
                    <a href="payment.jsp" class="btn btn-light payment-btn"><i class="fas fa-credit-card"></i> PAY NOW</a>
                </li>

                <!-- If user not logged in -->
                <c:if test="${empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link" href="admin_login.jsp"><i class="fa-solid fa-user-shield"></i> ADMIN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="doctor_login.jsp"><i class="fas fa-user-md"></i> DOCTOR</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user_appointment.jsp"><i class="fa fa-book"></i> APPOINTMENT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user_login.jsp"><i class="fas fa-user"></i> USER</a>
                    </li>
                </c:if>

                <!-- If user is logged in -->
                <c:if test="${not empty userObj}">
                    <li class="nav-item">
                        <a class="nav-link" href="user_appointment.jsp"><i class="fa fa-book"></i> APPOINTMENT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="view_appointment.jsp"><i class="fa fa-calendar-check"></i> VIEW APPOINTMENT</a>
                    </li>

                    <!-- User Dropdown -->
                    <div class="dropdown">
                        <button class="btn btn-outline-light dropdown-toggle user-dropdown" type="button"
                            id="dropdownMenuButton1" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="fa-solid fa-circle-user"></i> ${userObj.fullName}
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
                            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                        </ul>
                    </div>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!-- Custom CSS -->
<style>
    /* Navbar Styles */
    .custom-navbar {
        background: rgba(44, 62, 80, 0.95);
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        padding: 10px 20px;
    }

    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        transition: transform 0.2s ease-in-out;
    }

/*    .navbar-brand:hover {
        transform: scale(1.1);
    }*/

    .nav-link {
        font-weight: 500;
        color: #fff !important;
        transition: all 0.3s ease-in-out;
    }

    .nav-link:hover {
        color: #ffdd57 !important;
        transform: scale(1.1);
    }

    /* Search Bar */
    .search-form {
        display: flex;
        align-items: center;
        margin-left: 15px; /* Moves search bar closer to HMS */
    }

    .search-input {
        width: 280px;
        border-radius: 20px 0px 0px 20px;
        padding: 8px 15px;
        border: none;
        outline: none;
    }

    .search-btn {
        border-radius: 0px 20px 20px 0px;
        padding: 8px 15px;
        border: none;
        outline: none;
    }

    .search-btn:hover {
        background: #ffdd57;
        color: #333;
    }

    /* Payment Button */
.payment-btn {
    border-radius: 25px; /* Rounded corners */
    font-weight: bold; /* Bold text */
    padding: 8px 16px; /* Slightly larger padding for better clickability */
    transition: all 0.3s ease-in-out; /* Smooth transition for all properties */
    margin-right: 15px; /* Spacing between buttons */
    color: #fff; /* White text */
    border: 2px solid #fff; /* Thicker border for better visibility */
    background: transparent; /* Transparent background */
    position: relative; /* For pseudo-elements */
    overflow: hidden; /* Hide overflow for pseudo-elements */
    cursor: pointer; /* Pointer cursor on hover */
    font-size: 14px; /* Slightly larger font size */
    text-transform: uppercase; /* Uppercase text for a modern look */
    letter-spacing: 1px; /* Spacing between letters */
}

.payment-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent); /* Shiny gradient effect */
    transition: left 0.5s ease-in-out; /* Smooth transition for the shine effect */
}

.payment-btn:hover::before {
    left: 100%; /* Move the shine effect across the button */
}

.payment-btn:hover {
    background: rgba(255, 255, 255, 0.1); /* Slightly more visible hover effect */
    color: #f8f9fa; /* Soft white for better readability */
    transform: scale(1.05); /* Slight scaling effect for a smooth UI */
    box-shadow: 0px 0px 15px rgba(255, 255, 255, 0.3); /* Soft glow effect */
    border-color: rgba(255, 255, 255, 0.5); /* Lighter border on hover */
}

.payment-btn:active {
    transform: scale(0.95); /* Slight shrink effect when clicked */
    box-shadow: 0px 0px 5px rgba(255, 255, 255, 0.2); /* Smaller shadow on click */
}



    /* User Dropdown */
    .user-dropdown {
        border-radius: 25px;
        padding: 5px 15px;
        transition: all 0.3s ease-in-out;
    }

    .user-dropdown:hover {
        background: #ffdd57;
        color: #333;
    }

    @media (max-width: 992px) {
        .search-form {
            width: 100%;
            margin: 10px 0;
        }

        .search-input {
            width: 100%;
        }
    }
</style>
