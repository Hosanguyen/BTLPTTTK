<%@page import="DAO.TKNCC376DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.NguoiDung376"%>
<%@page import="Model.TKNCC376"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống Kê Nhà Cung Cấp</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px; /* Khoảng cách giữa các phần tử trong form */
        }

        .input-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        input[type="date"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%; /* Full width */
            max-width: 200px; /* Giới hạn chiều rộng của ô nhập */
        }

        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: black;
            text-decoration: none;
            font-weight: bold;
        }

        td a:hover {
            text-decoration: underline;
        }

        .no-data {
            text-align: center;
            color: #999;
            font-size: 18px;
            padding: 20px;
        }
        .logout {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .logout a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            font-size: 16px;
            padding: 10px;
            background-color: #fff;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .logout a:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<%
    NguoiDung376 user = (NguoiDung376) session.getAttribute("user");
    if(user == null){
        response.sendRedirect("/BTL/NguoiDung376/Home.jsp");
    }
    else if(!user.getVaiTro().equals("QuanLy")){
        response.sendRedirect("/BTL/NguoiDung376/Home.jsp");
    }
    String ngayBatDauStr = session.getAttribute("ngayBatDau") != null ? session.getAttribute("ngayBatDau").toString() : "";
    String ngayKetThucStr = session.getAttribute("ngayKetThuc") != null ? session.getAttribute("ngayKetThuc").toString() : "";

    if("POST".equalsIgnoreCase(request.getMethod())){
        ngayBatDauStr = request.getParameter("ngayBatDau");
        ngayKetThucStr = request.getParameter("ngayKetThuc");
        session.setAttribute("ngayBatDau", ngayBatDauStr);
        session.setAttribute("ngayKetThuc", ngayKetThucStr);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilNgayBatDau = dateFormat.parse(ngayBatDauStr);  
        java.sql.Date ngayBatDau = new java.sql.Date(utilNgayBatDau.getTime());  

        java.util.Date utilNgayKetThuc= dateFormat.parse(ngayKetThucStr);  
        java.sql.Date ngayKetThuc = new java.sql.Date(utilNgayKetThuc.getTime());  

        ArrayList<TKNCC376> listTKNCC = new TKNCC376DAO().getTKNCC(ngayBatDau, ngayKetThuc);
        session.setAttribute("listTKNCC", listTKNCC);
    }
%>
<body>
<div class="logout">
    <a href="/BTL/NguoiDung376/Logout.jsp">Logout</a>
</div>
<div class="container">
    <h2>Thống Kê Nhà Cung Cấp</h2>

    <form action="GDTKNCC376.jsp" method="POST">
        <div class="input-container">
            <label for="startDate">Ngày Bắt Đầu:</label>
            <input type="date" id="startDate" name="ngayBatDau" 
                   value="<%= ngayBatDauStr != null ? ngayBatDauStr : "" %>">
        </div>
        <div class="input-container">
            <label for="endDate">Ngày Kết Thúc:</label>
            <input type="date" id="endDate" name="ngayKetThuc" 
                   value="<%= ngayKetThucStr != null ? ngayKetThucStr : "" %>">
        </div>
        <button type="submit">Tải Lại Thống Kê</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>Mã NCC</th>
                <th>Tên NCC</th>
                <th>Số Lần Nhập</th>
                <th>Số Lượng Nhập</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<TKNCC376> listTKNCC = (List<TKNCC376>) session.getAttribute("listTKNCC");
                if (listTKNCC != null && !listTKNCC.isEmpty()) {
                    for (TKNCC376 ncc : listTKNCC) {
            %>
            <tr>
                <td><%= ncc.getId() %></td>
                <td>
                    <a href="GDNCC376.jsp?id=<%= ncc.getId() %>">
                        <%= ncc.getTenNCC() %>
                        <%
                            session.setAttribute("tkncc" + ncc.getId(), ncc);
                        %>
                    </a>
                </td>
                <td><%= ncc.getSoLanNhap() %></td>
                <td><%= ncc.getSoLuongNhap() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="no-data">Không có dữ liệu</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
