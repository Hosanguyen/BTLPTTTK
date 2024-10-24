/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author PC
 */
public class HoaDon376 {
    private int id;
    private ArrayList<TaiLieuNhap376> listTaiLieuNhap;
    private java.sql.Date ngayNhap;
    private int tongSoLuong;
    private float tongGia;
    private NCC376 nhaCungCap;
    private NhanVienThuVien376 nhanVien;

    public HoaDon376(int id, java.sql.Date ngayNhap, int tongSoLuong, float tongGia, NCC376 nhaCungCap, NhanVienThuVien376 nhanVien) {
        this.id = id;
        this.ngayNhap = ngayNhap;
        this.tongSoLuong = tongSoLuong;
        this.tongGia = tongGia;
        this.nhaCungCap = nhaCungCap;
        this.nhanVien = nhanVien;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<TaiLieuNhap376> getListTaiLieuNhap() {
        return listTaiLieuNhap;
    }

    public void setListTaiLieuNhap(ArrayList<TaiLieuNhap376> listTaiLieuNhap) {
        this.listTaiLieuNhap = listTaiLieuNhap;
    }

    public Date getNgayNhap() {
        return ngayNhap;
    }

    public void setNgayNhap(java.sql.Date ngayNhap) {
        this.ngayNhap = ngayNhap;
    }

    public int getTongSoLuong() {
        return tongSoLuong;
    }

    public void setTongSoLuong(int tongSoLuong) {
        this.tongSoLuong = tongSoLuong;
    }

    public float getTongGia() {
        return tongGia;
    }

    public void setTongGia(float tongGia) {
        this.tongGia = tongGia;
    }

    public NCC376 getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(NCC376 nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }

    public NhanVienThuVien376 getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVienThuVien376 nhanVien) {
        this.nhanVien = nhanVien;
    }

    
}
