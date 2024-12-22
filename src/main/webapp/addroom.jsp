<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Room</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
<style>
    .form-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background: #f8f9fa;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
</style>

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">HotelEase</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="admin.jsp" class="nav-link">Admin Dashboard</a></li>
            <li class="nav-item"><a href="alogout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="form-container">
        <h2 class="text-center">Add a New Room</h2>

        <% 
        String message = "";
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String roomNumber = request.getParameter("room_number");
            String type = request.getParameter("type");
            String price = request.getParameter("price");

            if (roomNumber != null && type != null && price != null) {
                try {
                    String query = "INSERT INTO rooms (room_number, type, price, availability) VALUES (?, ?, ?, 'Available')";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, roomNumber);
                    ps.setString(2, type);
                    ps.setString(3, price);
                    int result = ps.executeUpdate();

                    if (result > 0) {
                        message = "<div class='alert alert-success'>Room added successfully!</div>";
                    } else {
                        message = "<div class='alert alert-danger'>Failed to add the room. Please try again.</div>";
                    }
                } catch (Exception e) {
                    message = "<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>";
                }
            } else {
                message = "<div class='alert alert-warning'>Please fill out all fields.</div>";
            }
        }
        %>

        <%= message %>

        <form method="post">
            <div class="form-group">
                <label>Room Number</label>
                <input type="text" class="form-control" name="room_number" placeholder="Enter room number" required>
            </div>
            <div class="form-group">
                <label>Type</label>
                <select class="form-control" name="type" required>
                    <option value="Single">Single</option>
                    <option value="Double">Double</option>
                    <option value="Suite">Suite</option>
                </select>
            </div>
            <div class="form-group">
                <label>Price</label>
                <input type="number" class="form-control" name="price" placeholder="Enter price per night" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Room</button>
        </form>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 HotelEase. All rights reserved.</p>
</footer>
</body>
</html>