/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.io.Serializable;
import java.sql.*;
/**
 *
 * @author PC
 */
public class TKNCC376 extends NCC376{
    private int soLanNhap;
    private int soLuongNhap;
    private java.sql.Date startTime;
    private java.sql.Date endTime;

    public TKNCC376(int soLanNhap, int soLuongNhap, java.sql.Date startTime, java.sql.Date endTime, int id, String tenNCC, String diaChi, String lienLac) {
        super(id, tenNCC, diaChi, lienLac);
        this.soLanNhap = soLanNhap;
        this.soLuongNhap = soLuongNhap;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getSoLanNhap() {
        return soLanNhap;
    }

    public void setSoLanNhap(int soLanNhap) {
        this.soLanNhap = soLanNhap;
    }

    public int getSoLuongNhap() {
        return soLuongNhap;
    }

    public void setSoLuongNhap(int soLuongNhap) {
        this.soLuongNhap = soLuongNhap;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

}

