<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Room</title>
</head>
<body>
<%
String roomNumber = request.getParameter("room_number");
String username = (String) session.getAttribute("username");

if (username == null) {
    out.println("<script>alert('Please login first!');window.location.href='index.jsp';</script>");
} else {
    String query = "UPDATE rooms SET availability='Booked', booked_by=?, booking_date=NOW() WHERE room_number=?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, username);
    ps.setString(2, roomNumber);

    int result = ps.executeUpdate();
    if (result > 0) {
        out.println("<script>alert('Room booked successfully!');window.location.href='user.jsp';</script>");
    } else {
        out.println("<script>alert('Error booking room!');window.location.href='roomlist.jsp';</script>");
    }
}
%>

</body>
</html>