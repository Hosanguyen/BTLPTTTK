<%@page import="java.util.Calendar"%>
<%@page import="Model.NguoiDung376"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin Đăng ký Bạn Đọc</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%
    // Lấy dữ liệu từ session
    NguoiDung376 user = (NguoiDung376) session.getAttribute("user");
    if(user == null){
    response.sendRedirect("/BTL/Home.jsp");
    }
    String hoTen = user != null ? user.getHoTen() : "";
    String maBanDoc = user != null ? Integer.toString( user.getId()): "";
    String diaChi = user != null ? user.getDiaChi() : "";
    Calendar calendar = Calendar.getInstance();
    int year = calendar.get(Calendar.YEAR);
    int month = calendar.get(Calendar.MONTH) + 1;  // Tháng bắt đầu từ 0, nên cần +1
    int day = calendar.get(Calendar.DAY_OF_MONTH);
    String ngayDangKy = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);

    // Tính ngày hết hạn (5 năm sau ngày đăng ký)
    calendar.add(Calendar.YEAR, 5);
    int yearHetHan = calendar.get(Calendar.YEAR);
    int monthHetHan = calendar.get(Calendar.MONTH) + 1;
    int dayHetHan = calendar.get(Calendar.DAY_OF_MONTH);
    String ngayHetHan = yearHetHan + "-" + (monthHetHan < 10 ? "0" + monthHetHan : monthHetHan) + "-" + (dayHetHan < 10 ? "0" + dayHetHan : dayHetHan);
%>

<div class="form-container">
    <h1>Thông tin Bạn Đọc</h1>
    
    <form action="..\\DangKy376Controller" method="post">
        <div class="form-group">
            <label for="hoTen">Họ tên:</label>
            <input type="text" id="hoTen" name="hoTen" value="<%= hoTen != null ? hoTen : "" %>" required>
        </div>

        <div class="form-group">
            <label for="maBanDoc">Mã bạn đọc:</label>
            <input type="text" id="maBanDoc" name="maBanDoc" value="<%= maBanDoc != null ? maBanDoc : "" %>" required>
        </div>

        <div class="form-group">
            <label for="diaChi">Địa chỉ:</label>
            <input type="text" id="diaChi" name="diaChi" value="<%= diaChi != null ? diaChi : "" %>" required>
        </div>

        <div class="form-group">
            <label for="ngayDangKy">Ngày đăng ký:</label>
            <input type="date" id="ngayDangKy" name="ngayDangKy" value="<%= ngayDangKy != null ? ngayDangKy : "" %>" readonly>
        </div>

        <div class="form-group">
            <label for="ngayHetHan">Ngày hết hạn:</label>
            <input type="date" id="ngayHetHan" name="ngayHetHan" value="<%= ngayHetHan != null ? ngayHetHan : "" %>" readonly>
        </div>

        <input type="submit" class="submit-btn" value="Lưu thông tin">
    </form>
            <p><%= request.getParameter("message") != null && request.getParameter("message").equals("exist") ? "Đã có thẻ bạn đọc" : "" %></p>
            <p><%= request.getParameter("message") != null && request.getParameter("message").equals("success") ? "Đăng ký thành công" : "" %></p>
</div>

</body>
</html>
