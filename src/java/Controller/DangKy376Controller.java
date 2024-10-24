/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import DAO.TheBanDoc376DAO;
import Model.TheBanDoc376;
import Model.NguoiDung376;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
/**
 *
 * @author PC
 */
@WebServlet(name = "DangKy376Controller", urlPatterns = {"/DangKy376Controller"})
public class DangKy376Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            NguoiDung376 user = (NguoiDung376) session.getAttribute("user");
            TheBanDoc376DAO theBanDocDAO = new TheBanDoc376DAO();
            
            if(user == null){
                response.sendRedirect("Home.jsp");
            }
            if(theBanDocDAO.checkTheBanDoc(user)){
                TheBanDoc376 theBanDoc = theBanDocDAO.getTheBanDoc(user);
                request.setAttribute("theBanDoc", theBanDoc);
                response.sendRedirect("BanDoc376\\GDDangKy376.jsp?message=exist");
            }
            else {
                int id = Integer.parseInt(request.getParameter("maBanDoc"));

                String hoTen = request.getParameter("hoTen");
                String diaChi = request.getParameter("diaChi");
                String ngayDangKyStr = request.getParameter("ngayDangKy");
                String ngayHetHanStr = request.getParameter("ngayHetHan");
                
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                java.util.Date utilNgayDangKy = dateFormat.parse(ngayDangKyStr);  
                java.sql.Date ngayDangKy = new java.sql.Date(utilNgayDangKy.getTime());  

                java.util.Date utilNgayHetHan = dateFormat.parse(ngayHetHanStr);  
                java.sql.Date ngayHetHan = new java.sql.Date(utilNgayHetHan.getTime());  

                TheBanDoc376 newTheBanDoc = new TheBanDoc376(id, hoTen, diaChi, ngayDangKy, ngayHetHan);
                theBanDocDAO.luuDangKy(newTheBanDoc);
//                session.setAttribute("dangky", "Đăng ký thành công");
                response.sendRedirect("BanDoc376\\GDDangKy376.jsp?message=success");
            }
        } catch(Exception ex){}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
