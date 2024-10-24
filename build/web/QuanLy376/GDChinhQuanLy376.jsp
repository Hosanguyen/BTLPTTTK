<%@page import="Model.NguoiDung376"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    NguoiDung376 user = (NguoiDung376) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("/BTL/Home.jsp");
    }
    else if(!user.getVaiTro().equals("QuanLy")){
        response.sendRedirect("/BTL/Home.jsp");
    }
    else {
%>
<head>
    <title>GD Chính Quản Lý</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #007BFF;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>GD Chính Quản Lý</h1>
        
        <a href="GDChonTK376.jsp">Xem thống kê</a>
    </div>
</body>
<%
    }
%>
</html>
