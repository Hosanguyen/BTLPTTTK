    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.HoaDon376;
import Model.NCC376;
import Model.NhanVienThuVien376;
import Model.TKNCC376;
import java.sql.*;
import java.util.ArrayList;


/**
 *
 * @author PC
 */
public class HoaDon376DAO extends DAO{

    public HoaDon376DAO() throws Exception {
    }
    
    public ArrayList<HoaDon376> getAllHoaDon(TKNCC376 tkncc) throws SQLException{
        
        ArrayList<HoaDon376> listHoaDon = new ArrayList<>();
        
        String query = "EXEC getAllHoaDon ?, ?, ?";
        
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        ps.setInt(1, tkncc.getId());
        ps.setDate(2, tkncc.getStartTime());
        ps.setDate(3, tkncc.getEndTime());
        NCC376 ncc = new NCC376(tkncc.getId(), tkncc.getTenNCC(), tkncc.getDiaChi(), tkncc.getLienLac());
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            int idHoaDon = rs.getInt(1);
            int soLuong = rs.getInt("soLuong");
            java.sql.Date ngayNhap = rs.getDate("ngayNhap");
            float tong = rs.getFloat("tong");
            
            int nvId = rs.getInt("tblNhanVienThuVienId");
            String tenTaiKhoan = rs.getString("tenDangNhap");
            String matKhau = rs.getString("matKhau");
            String hoTen = rs.getString("hoTen");
            String sdt = rs.getString("soDienThoai");
            String email = rs.getString("email");
            String diaChi = rs.getString("diaChi");
            String vaiTro = rs.getString("vaiTro");

            NhanVienThuVien376 nhanVien = new NhanVienThuVien376(nvId, tenTaiKhoan, matKhau, hoTen, sdt, email, diaChi, vaiTro);
            HoaDon376 hoaDon = new HoaDon376(idHoaDon, ngayNhap, soLuong, tong, ncc, nhanVien);
            listHoaDon.add(hoaDon);
        }
        
        return listHoaDon;
    }
    
    public HoaDon376 getHoaDon(int hoaDonId) throws SQLException{
        
        ArrayList<HoaDon376> listHoaDon = new ArrayList<>();
        
        String query = "EXEC getHoaDon ?";
        
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        ps.setInt(1, hoaDonId);
       
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            int idHoaDon = rs.getInt(1);
            int soLuong = rs.getInt("soLuong");
            java.sql.Date ngayNhap = rs.getDate("ngayNhap");
            float tong = rs.getFloat("tong");
            
            int nvId = rs.getInt("tblNhanVienThuVienId");
            String tenTaiKhoan = rs.getString("tenDangNhap");
            String matKhau = rs.getString("matKhau");
            String hoTen = rs.getString("hoTen");
            String sdt = rs.getString("soDienThoai");
            String email = rs.getString("email");
            String diaChi = rs.getString(13);
            String vaiTro = rs.getString("vaiTro");
            
            int nccId = rs.getInt("tblNCCId");
            String tenNCC = rs.getString("tenNCC");
            String diaChiNCC = rs.getString(17);
            String lienLac = rs.getString("lienLac");
            
            NhanVienThuVien376 nhanVien = new NhanVienThuVien376(nvId, tenTaiKhoan, matKhau, hoTen, sdt, email, diaChi, vaiTro);
            NCC376 ncc = new NCC376(nccId, tenNCC, diaChiNCC, lienLac);
            HoaDon376 hoaDon = new HoaDon376(idHoaDon, ngayNhap, soLuong, tong, ncc, nhanVien);
            return hoaDon;
        }
        
        return null;
    }
    
}
