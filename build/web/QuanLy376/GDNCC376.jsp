<%@page import="Model.NguoiDung376"%>
<%@page import="DAO.HoaDon376DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.HoaDon376"%>
<%@page import="Model.NCC376"%>
<%@page import="Model.TKNCC376"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống Kê Chi Tiết Nhà Cung Cấp</title>
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
<body>

<%
    NguoiDung376 user = (NguoiDung376)session.getAttribute("user");
    if(user == null){
        response.sendRedirect("/BTL/NguoiDung376/Home.jsp");
    }
    else if (!user.getVaiTro().equals("QuanLy")){
        response.sendRedirect("/BTL/NguoiDung376/Home.jsp");
    }
    int id = Integer.parseInt(request.getParameter("id"));
    TKNCC376 tkncc = (TKNCC376)session.getAttribute("tkncc" + id);
    if(tkncc == null){
        response.sendRedirect("/BTL/NguoiDung376/Home.jsp");
    }
    else{
        String ngayBatDauStr = session.getAttribute("ngayBatDau").toString();
        String ngayketThucStr = session.getAttribute("ngayKetThuc").toString();
        
        ArrayList<HoaDon376> listHoaDon = new HoaDon376DAO().getAllHoaDon(tkncc);
%>
    
<div class="logout">
    <a href="/BTL/NguoiDung376/Logout.jsp">Logout</a>
</div>
<div class="container">
    <h2>Thống Kê Chi Tiết Nhà Cung Cấp</h2>

    <form action="TKNCC376Controller" method="GET">
        <div class="input-container">
            <label for="startDate">Nhà cung cấp: <%= tkncc.getTenNCC()%></label>
        </div>
        <div class="input-container">
            <label for="startDate">Ngày Bắt Đầu:</label>
            <input type="date" id="startDate" name="ngayBatDau" 
                   value="<%= ngayBatDauStr != null ? ngayBatDauStr : "" %>" readonly>
        </div>
        <div class="input-container">
            <label for="endDate">Ngày Kết Thúc:</label>
            <input type="date" id="endDate" name="ngayKetThuc" 
                   value="<%= ngayketThucStr != null ? ngayketThucStr : "" %>" readonly>
        </div>
    </form>

    <table>
        <thead>
            <tr>
                <th>Mã Hóa Đơn</th>
                <th>Lần Nhập</th>
                <th>Ngày Nhập</th>
                <th>Số Lượng Nhập</th>
                <th>Giá Nhập</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%
                // Lấy danh sách từ session
                DecimalFormat df = new DecimalFormat("#,###.00");
                if (listHoaDon != null && !listHoaDon.isEmpty()) {
                    int idx = 0;
                    for (HoaDon376 hoaDon : listHoaDon) {
                    idx++;
            %>
            <tr>
                <td><%= hoaDon.getId() %></td>
                <td><%= idx%></td>
                <td><%= hoaDon.getNgayNhap()%></td>
                <td><%= hoaDon.getTongSoLuong()%></td>
                <td><%= df.format(hoaDon.getTongGia())%></td>
                <td>
                    <%
                        session.setAttribute("hoaDon" + hoaDon.getId(), hoaDon);
                    %>
                    <a href="GDHoaDon376.jsp?id=<%= hoaDon.getId()%>&lanNhap=<%= idx%>&ngayNhap=<%= hoaDon.getNgayNhap()%>">Xem chi tiết</a>
                </td>
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
<%
    }
%>
</body>
</html>
