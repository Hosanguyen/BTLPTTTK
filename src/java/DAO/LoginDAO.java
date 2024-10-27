/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.NguoiDung376;
import java.sql.*;

/**
 *
 * @author PC
 */
public class LoginDAO extends DAO{

    public LoginDAO() throws Exception {
    }
    
    public NguoiDung376 checkLogin(NguoiDung376 user)throws SQLException{
        
        String query = "SELECT * FROM tblNguoiDung376 WHERE tenDangNhap = ? AND matKhau = ?";
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        ps.setString(1, user.getTenDangNhap());
        ps.setString(2, user.getMatKhau());
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            int id = rs.getInt("id");
            String hoTen = rs.getString("hoTen");
            String email = rs.getString("email");
            String diaChi = rs.getString("diaChi");
            String vaiTro = rs.getString("vaiTro");
            String sdt = rs.getString("soDienThoai");
            return new NguoiDung376(id, user.getTenDangNhap(), user.getMatKhau(), hoTen, sdt, email, diaChi, vaiTro);
        }
        return null;
    }
}
