/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import Model.TKNCC376;
import java.sql.*;

/**
 *
 * @author PC
 */
public class TKNCC376DAO extends DAO{

    public TKNCC376DAO() throws Exception {
    }
    
    public ArrayList<TKNCC376> getTKNCC(java.sql.Date startTime, java.sql.Date endTime) throws SQLException{
        ArrayList<TKNCC376> listTKNCC = new ArrayList<>();
        
        String query = "EXEC getTKNCC ?, ?";
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        
        ps.setDate(1, startTime);
        ps.setDate(2, endTime);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
            int id = rs.getInt("id");
            String tenNCC = rs.getString("tenNCC");
            String diaChi = rs.getString("diaChi");
            String lienLac = rs.getString("lienLac");
            int soLanNhap = rs.getInt("soLanNhap");
            int soLuongNhap = rs.getInt("soLuongNhap");
            TKNCC376 tkncc = new TKNCC376(soLanNhap, soLuongNhap, startTime, endTime, id, tenNCC, diaChi, lienLac);
            listTKNCC.add(tkncc);
        }
        return listTKNCC;
    }
    
}
