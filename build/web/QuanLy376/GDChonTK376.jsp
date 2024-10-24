<%@page import="Model.NguoiDung376"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8">
    <title>Chọn Thống Kê</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin: 20px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }
        input, select {
            padding: 10px;
            margin-top: 5px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-container form {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Chọn Thống Kê</h2>

    <form action="..\\TKNCC376Controller" method="post">
        <label for="loaiThongKe">Loại Thống Kê:</label>
        <select id="loaiThongKe" name="loaiThongKe" required>
            <option value="">-- Chọn loại thống kê --</option>
            <option value="tkncc">Thống kê nhà cung cấp theo số lần nhập</option>
        </select>

        <label for="ngayBatDau">Ngày Bắt Đầu:</label>
        <input type="date" id="ngayBatDau" name="ngayBatDau" required>

        <label for="ngayKetThuc">Ngày Kết Thúc:</label>
        <input type="date" id="ngayKetThuc" name="ngayKetThuc" required>

        <button type="submit">Xem Thống Kê</button>
    </form>
</div>
</body>
<%
    }
%>
</html>
