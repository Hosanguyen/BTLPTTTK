/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.TKNCC376DAO;
import Model.NguoiDung376;
import Model.TKNCC376;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "TKNCC376Controller", urlPatterns = {"/TKNCC376Controller"})
public class TKNCC376Controller extends HttpServlet {

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
        HttpSession session = request.getSession();
        NguoiDung376 user = (NguoiDung376) session.getAttribute("user");
        if(user == null){
            response.sendRedirect("Home.jsp");
        }
        else if(!user.getVaiTro().equals("QuanLy") ){
            response.sendRedirect("Home.jsp");
        }
        try {
            /* TODO output your page here. You may use following sample code. */
            String ngayBatDauStr = request.getParameter("ngayBatDau");
            String ngayKetThucStr = request.getParameter("ngayKetThuc");
            session.setAttribute("ngayBatDau", ngayBatDauStr);
            session.setAttribute("ngayKetThuc", ngayKetThucStr);
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilNgayBatDau = dateFormat.parse(ngayBatDauStr);  
            java.sql.Date ngayBatDau = new java.sql.Date(utilNgayBatDau.getTime());  

            java.util.Date utilNgayKetThuc= dateFormat.parse(ngayKetThucStr);  
            java.sql.Date ngayKetThuc = new java.sql.Date(utilNgayKetThuc.getTime());  
                        
            ArrayList<TKNCC376> listTKNCC = new TKNCC376DAO().getTKNCC(ngayBatDau, ngayKetThuc);
            session.setAttribute("listTKNCC", listTKNCC);
//            response.sendRedirect("GDTKNCC376.jsp?ngayBatDau=" + ngayBatDauStr + "&ngayKetThuc=" + ngayKetThucStr);
            response.sendRedirect("QuanLy376\\GDTKNCC376.jsp");
        } catch(Exception ex){
   
        }  
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
