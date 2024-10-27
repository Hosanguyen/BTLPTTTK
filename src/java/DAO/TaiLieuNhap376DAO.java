/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.HoaDon376;
import Model.TaiLieuNhap376;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author PC
 */
public class TaiLieuNhap376DAO extends DAO{

    public TaiLieuNhap376DAO() throws Exception {
    }
    
    public ArrayList<TaiLieuNhap376> getTaiLieuNhap(HoaDon376 hoaDon) throws SQLException{
        
        ArrayList<TaiLieuNhap376> listTaiLieuNhap = new ArrayList<>();
        
        String query = "EXEC getTaiLieuNhap ?";
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        ps.setInt(1, hoaDon.getId());
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            int id = rs.getInt("id");
            String tenTaiLieu = rs.getString("tenTaiLieu");
            String loaiTaiLieu = rs.getString("loaiTaiLieu");
            String tacGia = rs.getString("tacGia");
            float donGia = rs.getFloat("donGia");
            int soLuong = rs.getInt("soLuong");
            String nhaXuatBan = rs.getString("nhaXuatBan");
            float tong = donGia * (float)soLuong;
            TaiLieuNhap376 taiLieuNhap = new TaiLieuNhap376(tong, id, tenTaiLieu, loaiTaiLieu, tacGia, nhaXuatBan, soLuong, donGia);
            listTaiLieuNhap.add(taiLieuNhap);
        }
        
        return listTaiLieuNhap;
    }
    
}
