/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;
import java.sql.*;

/**
 *
 * @author PC
 */
public class TheBanDoc376 {
    private int id;
    private String hoTen;
    private String ngaySinh;
    private String diaChi;
    private java.sql.Date ngayDangKy;
    private java.sql.Date ngayHetHan;

    public TheBanDoc376(int id, String hoTen, String diaChi, java.sql.Date ngayDangKy, java.sql.Date ngayHetHan) {
        this.id = id;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.ngayDangKy = ngayDangKy;
        this.ngayHetHan = ngayHetHan;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public java.sql.Date getNgayDangKy() {
        return ngayDangKy;
    }

    public void setNgayDangKy(java.sql.Date ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }

    public java.sql.Date getNgayHetHan() {
        return ngayHetHan;
    }

    public void setNgayHetHan(java.sql.Date ngayHetHan) {
        this.ngayHetHan = ngayHetHan;
    }
    
    
}
