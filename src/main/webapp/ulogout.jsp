<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Logout</title>
</head>
<body>
<%
    // Invalidate the session
    session.invalidate();

    // Redirect to the homepage
    response.sendRedirect("index.jsp");
%>
</body>
</html>