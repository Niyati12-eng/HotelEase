<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Reservations</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <h1>Your Reservations</h1>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Room Number</th>
                <th>Type</th>
                <th>Price</th>
                <th>Booking Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            String username = (String) session.getAttribute("username");
            String query = "SELECT * FROM rooms WHERE booked_by=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("room_number") %></td>
                <td><%= rs.getString("type") %></td>
                <td><%= rs.getString("price") %></td>
                <td><%= rs.getString("booking_date") %></td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>
</body>
</html>