/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.NCC376;
import java.sql.*;
/**
 *
 * @author PC
 */
public class NCC376DAO extends DAO{

    public NCC376DAO() throws Exception {
    }
    
    public NCC376 getNCC(int id) throws Exception{
        String query = "Select * from tblNCC376 where id = ?";
        PreparedStatement ps = this.getConnection().prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            String tenNCC = rs.getString("tenNCC");
            String diaChi = rs.getString("diaChi");
            String lienLac = rs.getString("lienLac");
            NCC376 ncc = new NCC376(id, tenNCC, diaChi, lienLac);
            return ncc;
        }
        return null;
    }
}
