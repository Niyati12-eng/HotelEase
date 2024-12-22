<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure you have the MySQL JDBC driver.
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelDB", "root", ""); // Update database URL, username, and password.
    pageContext.setAttribute("conn", conn); // Store the connection in the page context.
} catch (Exception e) {
    out.println("<h3>Database connection error: " + e.getMessage() + "</h3>");
}
%>
</body>
</html>


<%@page import="java.sql.*"%>

