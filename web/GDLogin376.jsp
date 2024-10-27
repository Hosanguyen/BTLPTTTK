<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Model.NguoiDung376" %>
<%@ page import="DAO.LoginDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
                background-color: #f4f4f4;
            }
            .content {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                margin-bottom: 20px;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            p {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <h2>Login</h2>
            <form action="" method="post">
                <input type="text" name="username" placeholder="Username" required/>
                <input type="password" name="password" placeholder="Password" required/>
                <input type="submit" value="Login"/>
            </form>

            <!-- Handling login logic within JSP -->
            <%
                String error = "";
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    
                    NguoiDung376 userDangNhap = new NguoiDung376(username, password);
                    NguoiDung376 nguoiDung = new LoginDAO().checkLogin(userDangNhap);

                    if (nguoiDung != null) {
                        session.setAttribute("user", nguoiDung);

                        String role = nguoiDung.getVaiTro();
                        if ("QuanLy".equals(role)) {
                            response.sendRedirect("QuanLy376/GDChinhQuanLy376.jsp");
                        } else {
                            response.sendRedirect("BanDoc376/GDChinhBanDoc376.jsp");
                        }
                    } else {
                        error = "Invalid username or password";
                    }
                }
            %>

            <!-- Display error message -->
            <p><%= error %></p>
        </div>
    </body>
</html>
