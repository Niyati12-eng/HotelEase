<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
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
            <li class="nav-item"><a href="user.jsp" class="nav-link">Dashboard</a></li>
            <li class="nav-item"><a href="ulogout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="form-container">
        <h2 class="text-center">Edit Profile</h2>
        <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("index.jsp");
        }
        
        // Fetch user details from the database
        String email = "", contact = "", password = "";
        String query = "SELECT * FROM users WHERE username = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            email = rs.getString("email");
            contact = rs.getString("contact");
            password = rs.getString("password");
        }
        %>
        <form method="post" action="updateprofile.jsp">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" value="<%= username %>" disabled>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" value="<%= email %>" required>
            </div>
            <div class="form-group">
                <label>Contact Number</label>
                <input type="text" class="form-control" name="contact" value="<%= contact %>" required>
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter new password (optional)">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
        </form>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 HotelEase. All rights reserved.</p>
</footer>

</body>
</html>