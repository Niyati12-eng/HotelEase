<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Management System</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<style>
    .hero-section {
        height: 100vh;
        background: url('https://source.unsplash.com/1920x1080/?hotel') no-repeat center center/cover;
        display: flex;
        align-items: center;
        justify-content: center;
        color: black;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
    }
    .features {
        padding: 50px 0;
    }
    .card:hover {
        transform: scale(1.05);
        transition: all 0.3s ease;
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">HotelEase</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            <li class="nav-item">
                <button class="btn btn-success" data-toggle="modal" data-target="#loginModal">Login</button>
            </li>
        </ul>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
    <div class="text-center">
        <h1>Welcome to HotelEase</h1>
        <p>Your ultimate hotel booking experience</p>
        <a href="roomlist.jsp" class="btn btn-primary btn-lg">Explore Rooms</a>
    </div>
</div>

<!-- Features Section -->
<section id="features" class="features bg-light">
    <div class="container text-center">
        <h2>Our Features</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">Luxury Rooms</h5>
                        <p class="card-text">Stay in well-furnished, luxurious rooms equipped with all modern amenities.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">24/7 Customer Support</h5>
                        <p class="card-text">Enjoy seamless support for any queries or services during your stay.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">Exclusive Offers</h5>
                        <p class="card-text">Get the best deals and discounts for long stays and group bookings.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide mt-5" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://source.unsplash.com/1920x1080/?resort" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Elegant Rooms</h5>
                <p>Experience the ultimate comfort and elegance.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://source.unsplash.com/1920x1080/?beach-hotel" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Beachside Bliss</h5>
                <p>Stay close to nature and serenity.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://source.unsplash.com/1920x1080/?hotel-pool" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Relax and Rejuvenate</h5>
                <p>Enjoy world-class facilities and services.</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </a>
</div>

<!-- Contact Section -->
<section id="contact" class="text-center py-5 bg-dark text-white">
    <h2>Contact Us</h2>
    <p>Have questions or need assistance? Reach out to us anytime!</p>
    <a href="mailto:support@hotelease.com" class="btn btn-outline-light">Email Us</a>
</section>

</body>
</html>


<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Sign In</h5></div>
            <div class="modal-body">
                <form method="post" action="check.jsp">
                    <div class="form-group">
                        <label>Email or Username</label>
                        <input type="text" class="form-control" name="uemail" placeholder="Enter email or username">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="upass" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
