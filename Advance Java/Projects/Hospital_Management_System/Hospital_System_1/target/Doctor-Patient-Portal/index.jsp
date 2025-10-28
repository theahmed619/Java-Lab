<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HMS</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #2c3e50;
            --accent: #3498db;
            --secondary: #e74c3c;
            --light: #f8f9fa;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light);
        }
        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, rgba(44, 62, 80, 0.95), rgba(52, 152, 219, 0.9)), url('img/hos.jpg') center/cover;
            padding: 120px 0;
            color: white;
            text-align: center;
        }
        .cta-button {
            padding: 15px 40px;
            font-size: 1.1rem;
            border-radius: 50px;
            background: var(--secondary);
            border: none;
            transition: 0.3s;
        }
        .cta-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }
        /* Feature Cards */
        .feature-section {
            margin-top: -60px;
        }
        .feature-card {
            border-radius: 20px;
            padding: 30px;
            transition: 0.3s;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }
        .feature-icon {
            width: 70px;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--light);
            border-radius: 20px;
            font-size: 1.8rem;
        }
        /* Team Section */
        .team-card {
            transition: 0.3s;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        .team-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .team-img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border: 3px solid var(--accent);
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1 class="display-4 fw-bold">Advanced Healthcare for Everyone</h1>
            <p class="lead">Experience world-class medical care with cutting-edge technology.</p>
            <a href="user_appointment.jsp" class="btn cta-button">Book an Appointment</a>
        </div>
    </section>

    <!-- Features Section -->
<!-- Features Section -->
<section class="feature-section">
    <div class="container">
        <div class="row g-4">
            
            <div class="col-lg-3 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3 class="feature-title">100% Safety</h3>
                    <p>Advanced safety protocols and continuous monitoring for complete protection.</p>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-hospital"></i>
                    </div>
                    <h3 class="feature-title">Modern Facility</h3>
                    <p>State-of-the-art medical facilities with the latest technology.</p>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-user-md"></i>
                    </div>
                    <h3 class="feature-title">Expert Doctors</h3>
                    <p>Highly qualified professionals dedicated to providing the best care.</p>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-microscope"></i>
                    </div>
                    <h3 class="feature-title">Research Lab</h3>
                    <p>Advanced research facilities pushing the boundaries of medicine.</p>
                </div>
            </div>

        </div>
    </div>
</section>


    <!-- Team Section -->
    <section class="team-section py-5 bg-light">
        <div class="container">
            <h2 class="text-center text-success fw-bold">Meet Our Expert Team</h2>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="team-card text-center p-4 bg-white rounded">
                        <img src="https://pbs.twimg.com/profile_images/421396899036295168/jRjL34RS.jpeg" class="img-fluid team-img rounded-circle border" alt="Dr. Heisenberg">
                        <h5 class="mt-3">Dr. Heisenberg</h5>
                        <p class="text-muted">CEO & Chairman</p>
                    </div>
                </div>
                <div class="col">
                    <div class="team-card text-center p-4 bg-white rounded">
                        <img src="https://www.looper.com/img/gallery/how-old-is-wanda-in-wandavision/intro-1612546055.jpg" class="img-fluid team-img rounded-circle border" alt="Dr. Wanda">
                        <h5 class="mt-3">Dr. Wanda</h5>
                        <p class="text-muted">Chief Doctor</p>
                    </div>
                </div>
                    <div class="col">
                    <div class="team-card text-center p-4 bg-white rounded">
                        <img src="https://i.pinimg.com/originals/4c/78/a6/4c78a6155ccc914773009716ead2be10.jpg" class="img-fluid team-img rounded-circle border" alt="Dr. Wanda">
                        <h5 class="mt-3">Dr. John</h5>
                        <p class="text-muted">Chief Doctor</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="component/footer.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
