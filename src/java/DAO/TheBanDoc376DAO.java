/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Model.NguoiDung376;
import Model.TheBanDoc376;
import java.sql.*;
import java.util.*;
/**
 *
 * @author PC
 */
public class TheBanDoc376DAO extends DAO{

    public TheBanDoc376DAO() throws Exception {
    }
    
public boolean checkTheBanDoc(NguoiDung376 user) throws Exception {
    String query = "SELECT theBanDocId, ngayHetHan FROM tblBanDoc376 WHERE tblNguoiDungId = ?";
    PreparedStatement ps = this.getConnection().prepareStatement(query);
    int id = user.getId();
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        int theBanDocId = rs.getInt("theBanDocId");  
        
        if (theBanDocId == 0) {
            return false; 
        }

        java.sql.Date ngayHetHan = rs.getDate("ngayHetHan");  

        java.util.Date currentDate = new java.util.Date();

        if (ngayHetHan != null && ngayHetHan.after(currentDate)) {
            return true;  
        }
    }

    return false; 
}

    
    public TheBanDoc376 getTheBanDoc(NguoiDung376 user)throws Exception {
        
        return null;
    }
    
    public boolean luuDangKy(TheBanDoc376 theBanDoc) throws Exception{
        String query = "UPDATE tblBanDoc376 SET theBanDocId = ?, ngayDangKy = ?, ngayHetHan = ? WHERE tblNguoiDungId = ?";
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        
        java.sql.Date ngayDangKy = new java.sql.Date(theBanDoc.getNgayDangKy().getTime());
        java.sql.Date ngayHetHan = new java.sql.Date(theBanDoc.getNgayHetHan().getTime());
        
        ps.setInt(1, theBanDoc.getId());
        ps.setDate(2, theBanDoc.getNgayDangKy());
        ps.setDate(3, theBanDoc.getNgayHetHan());
        ps.setInt(4, theBanDoc.getId());

        return ps.executeUpdate() > 0;
    }
}
