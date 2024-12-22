<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email = request.getParameter("uemail");
String pass = request.getParameter("upass");
String query = "SELECT * FROM users WHERE (email='"+email+"' OR username='"+email+"') AND password='"+pass+"'";

PreparedStatement ps = conn.prepareStatement(query);

ResultSet rs = ps.executeQuery();

if (rs.next()) {
    String role = rs.getString("role");
    session.setAttribute("username", rs.getString("username"));
    if ("Admin".equals(role)) {
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("user.jsp");
    }
} else {
    out.println("<script>alert('Invalid Credentials');window.location.href='index.jsp';</script>");
}
%>
</body>
</html>