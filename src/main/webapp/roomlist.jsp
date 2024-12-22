<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Room Management</h1>

    <!-- Available Rooms Section -->
    <h3>Available Rooms</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Room Number</th>
                <th>Type</th>
                <th>Price</th>
                <th>Availability</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            // Fetch available rooms
            String availableQuery = "SELECT * FROM rooms WHERE availability='Available'";
            PreparedStatement psAvailable = conn.prepareStatement(availableQuery);
            ResultSet rsAvailable = psAvailable.executeQuery();
            while (rsAvailable.next()) {
            %>
            <tr>
                <td><%= rsAvailable.getString("room_number") %></td>
                <td><%= rsAvailable.getString("type") %></td>
                <td><%= rsAvailable.getString("price") %></td>
                <td><%= rsAvailable.getString("availability") %></td>
                <td>
                    <form method="post" action="bookroom.jsp">
                        <input type="hidden" name="room_number" value="<%= rsAvailable.getString("room_number") %>">
                        <button type="submit" class="btn btn-primary">Book</button>
                    </form>
                </td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <!-- Booked Rooms Section -->
    <h3>Booked Rooms</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Room Number</th>
                <th>Type</th>
                <th>Price</th>
                <th>Booked By</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            // Fetch booked rooms
            String bookedQuery = "SELECT * FROM rooms WHERE availability='Booked'";
            PreparedStatement psBooked = conn.prepareStatement(bookedQuery);
            ResultSet rsBooked = psBooked.executeQuery();
            while (rsBooked.next()) {
            %>
            <tr>
                <td><%= rsBooked.getString("room_number") %></td>
                <td><%= rsBooked.getString("type") %></td>
                <td><%= rsBooked.getDouble("price") %></td>
                <td><%= rsBooked.getString("booked_by") %></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="room_number" value="<%= rsBooked.getString("room_number") %>">
                        <button type="submit" name="checkout_room" class="btn btn-danger">Checkout</button>
                    </form>
                </td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>

<%
    // Checkout Room Logic
    if (request.getParameter("checkout_room") != null) {
        String roomNumber = request.getParameter("room_number");

        try {
            // Update room to be available and clear booking details
            String updateQuery = "UPDATE rooms SET availability='Available', booked_by=NULL, booking_date=NULL WHERE room_number=?";
            PreparedStatement psUpdate = conn.prepareStatement(updateQuery);
            psUpdate.setString(1, roomNumber);

            int result = psUpdate.executeUpdate();
            if (result > 0) {
                out.println("<script>alert('Room " + roomNumber + " has been checked out and is now available for booking.'); window.location.href='roomlist.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to checkout room. Please try again.');</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        }
    }
%>

<footer class="bg-dark text-white text-center py-3 mt-5">
    <p>&copy; 2024 HotelEase. All rights reserved.</p>
</footer>

</body>
</html>