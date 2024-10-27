<%@page import="DAO.TaiLieuNhap376DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.NguoiDung376"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Model.TaiLieuNhap376"%>
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
    <title>Hóa Đơn Chi Tiết Lần Nhập</title>
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
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .info-block {
            margin-bottom: 20px;
        }

        .info-block label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #666;
        }

        .info-block p {
            margin: 0;
            padding: 5px 0;
            font-size: 16px;
            color: #333;
        }
        
        .info-block label,
        .info-block p {
            display: inline-block;
            margin: 0; 
            padding: 0 10px; 
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

        .total-container {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end;
            font-size: 18px;
            font-weight: bold;
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
        response.sendRedirect("/BTL/Home.jsp");
    }
    else if (!user.getVaiTro().equals("QuanLy")){
        response.sendRedirect("/BTL/Home.jsp");
    }
    int idHoaDon = Integer.parseInt(request.getParameter("id"));
    int lanNhap = Integer.parseInt(request.getParameter("lanNhap"));
    String ngayNhap = request.getParameter("ngayNhap");
    session.setAttribute("lanNhap", lanNhap);
    HoaDon376 hoaDon = (HoaDon376)session.getAttribute("hoaDon" + idHoaDon);
    if(hoaDon == null)
    {
        response.sendRedirect("/BTL/Home.jsp");
    }
    else {
        ArrayList<TaiLieuNhap376> listTaiLieuNhap = new TaiLieuNhap376DAO().getTaiLieuNhap(hoaDon);
        hoaDon.setListTaiLieuNhap(listTaiLieuNhap);
%>
<div class="logout">
        <a href="/BTL/Logout.jsp">Logout</a>
</div>
<div class="container">
    <h2>Hóa Đơn Chi Tiết Lần Nhập</h2>

    <div class="info-block">
        <label>Nhà cung cấp:</label>
        <p><%= hoaDon.getNhaCungCap().getTenNCC() %></p>
    </div>

    <div class="info-block">
        <label>Lần Nhập:</label>
        <p><%= lanNhap %></p>
    </div>

    <div class="info-block">
        <label>Mã Hóa Đơn:</label>
        <p><%= hoaDon.getId() %></p>
    </div>

    <div class="info-block">
        <label>Ngày Nhập:</label>
        <p><%= hoaDon.getNgayNhap() %></p>
    </div>

    <div class="info-block">
        <label>Nhân viên phụ trách:</label>
        <p><%= hoaDon.getNhanVien().getHoTen() %> (Mã NV: <%= hoaDon.getNhanVien().getId() %>)</p>
    </div>

    <table>
        <thead>
            <tr>
                <th>Mã Tài Liệu</th>
                <th>Tên Tài Liệu</th>
                <th>Loại Tài Liệu</th>
                <th>Tác Giả</th>
                <th>Đơn Giá Nhập</th>
                <th>Số Lượng</th>
                <th>Tổng</th>
            </tr>
        </thead>
        <tbody>
            <%
                DecimalFormat df = new DecimalFormat("#,###.00");
                if (listTaiLieuNhap != null && !listTaiLieuNhap.isEmpty()) {
                    for (TaiLieuNhap376 taiLieuNhap : listTaiLieuNhap) {
            %>
            <tr>
                <td><%= taiLieuNhap.getId() %></td>
                <td><%= taiLieuNhap.getTenTaiLieu() %></td>
                <td><%= taiLieuNhap.getLoaiTaiLieu() %></td>
                <td><%= taiLieuNhap.getTacGia() %></td>
                <td><%= df.format(taiLieuNhap.getDonGia()) %></td>
                <td><%= taiLieuNhap.getSoLuong() %></td>
                <td><%= df.format(taiLieuNhap.getTong()) %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" class="no-data">Không có dữ liệu</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="total-container">
        Tổng cộng: <%= df.format(hoaDon.getTongGia()) %> VND
    </div>
</div>
<%
    }
%>

</body>
</html>
