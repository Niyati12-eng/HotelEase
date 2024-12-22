<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>

<style>
    .dashboard-header {
        background: linear-gradient(to right, #6a11cb, #2575fc);
        color: white;
        padding: 50px 0;
        text-align: center;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
    }
    .dashboard-header h1 {
        font-size: 3rem;
    }
    .cards-section {
        padding: 50px 0;
    }
    .card:hover {
        transform: scale(1.05);
        transition: all 0.3s ease;
    }
    .greeting {
        font-weight: bold;
    }
</style>
</head>
<body>

<!-- Dashboard Header -->
<div class="dashboard-header">
    <div class="container">
        <h1>Welcome Back, <%= session.getAttribute("username") %>!</h1>
        <p class="greeting">We're glad to have you here.</p>
        <a href="ulogout.jsp" class="btn btn-light">Logout</a>
    </div>
</div>

<!-- Quick Navigation Cards -->
<section class="cards-section">
    <div class="container text-center">
        <h2>Quick Navigation</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">Explore Rooms</h5>
                        <p class="card-text">View and book from a variety of luxurious rooms.</p>
                        <a href="roomlist.jsp" class="btn btn-primary">View Rooms</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">My Reservations</h5>
                        <p class="card-text">Check your current and past bookings at a glance.</p>
                        <a href="reservation.jsp" class="btn btn-success">View Reservations</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title">Edit Profile</h5>
                        <p class="card-text">Update your personal details and preferences.</p>
                        <a href="editprofile.jsp" class="btn btn-warning">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Reservation Highlights -->
<section class="bg-light py-5">
    <div class="container text-center">
        <h2>Your Booking Summary</h2>
        <div class="row mt-4">
            <% 
            String username = (String) session.getAttribute("username");
            String query = "SELECT COUNT(*) AS total FROM rooms WHERE booked_by=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            int totalBookings = 0;
            if (rs.next()) {
                totalBookings = rs.getInt("total");
            }
            %>
            <div class="col-md-6 offset-md-3">
                <div class="card shadow text-center">
                    <div class="card-body">
                        <h5 class="card-title">Total Bookings</h5>
                        <p class="card-text" style="font-size: 2rem;"><%= totalBookings %></p>
                        <a href="reservation.jsp" class="btn btn-info">View Details</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 HotelEase. All rights reserved.</p>
</footer>

</body>
</html>