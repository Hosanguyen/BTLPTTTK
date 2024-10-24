/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class TaiLieuNhap376 extends TaiLieu376{
    private float tong;

    public TaiLieuNhap376(float tong, int id, String tenTaiLieu, String loaiTaiLieu, String tacGia, String nhaXuatBan, int soLuong, float donGia) {
        super(id, tenTaiLieu, loaiTaiLieu, tacGia, nhaXuatBan, soLuong, donGia);
        this.tong = tong;
    }

    public float getTong() {
        return tong;
    }

    public void setTong(float tong) {
        this.tong = tong;
    }
    
    
}
