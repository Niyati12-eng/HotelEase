<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
<style>
    .table-container {
        margin: 50px auto;
    }
</style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">HotelEase</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="admin.jsp" class="nav-link">Admin Dashboard</a></li>
            <li class="nav-item"><a href="ulogout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container table-container">
    <h2 class="text-center">Registered Users</h2>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Role</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
            String query = "SELECT * FROM users";
            try {
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("contact") %></td>
                <td><%= rs.getString("role") %></td>
                <td><%= rs.getString("status") %></td>
            </tr>
            <% 
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='6' class='text-center text-danger'>Error fetching user data: " + e.getMessage() + "</td></tr>");
            }
            %>
        </tbody>
    </table>
</div>

<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 HotelEase. All rights reserved.</p>
</footer>

</body>
</html>