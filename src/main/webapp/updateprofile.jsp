<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String username = (String) session.getAttribute("username");
if (username == null) {
    response.sendRedirect("index.jsp");
}

String email = request.getParameter("email");
String contact = request.getParameter("contact");
String password = request.getParameter("password");

String query;
if (password == null || password.trim().isEmpty()) {
    // Update without changing the password
    query = "UPDATE users SET email = ?, contact = ? WHERE username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, contact);
    ps.setString(3, username);
    ps.executeUpdate();
} else {
    // Update including the password
    query = "UPDATE users SET email = ?, contact = ?, password = ? WHERE username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, contact);
    ps.setString(3, password);
    ps.setString(4, username);
    ps.executeUpdate();
}

out.println("<script>alert('Profile updated successfully!'); window.location.href='user.jsp';</script>");
%>

</body>
</html>