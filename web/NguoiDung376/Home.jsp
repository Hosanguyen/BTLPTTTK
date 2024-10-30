<%-- 
    Document   : Home
    Created on : Oct 21, 2024, 7:42:48 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.NguoiDung376"%>
<%@page session="true"%>

<%
    NguoiDung376 user = (NguoiDung376) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("GDLogin376.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h2>Welcome, <%= user.getHoTen() %>!</h2>
    <p>Role: <%= user.getVaiTro() %></p>
    <p>Email: <%= user.getEmail() %></p>

    <a href="logout">Logout</a>
</body>
</html>

