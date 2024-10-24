/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class NCC376 {
    private int id;
    private String tenNCC;
    private String diaChi;
    private String lienLac;

    public NCC376(int id, String tenNCC, String diaChi, String lienLac) {
        this.id = id;
        this.tenNCC = tenNCC;
        this.diaChi = diaChi;
        this.lienLac = lienLac;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenNCC() {
        return tenNCC;
    }

    public void setTenNCC(String tenNCC) {
        this.tenNCC = tenNCC;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getLienLac() {
        return lienLac;
    }

    public void setLienLac(String lienLac) {
        this.lienLac = lienLac;
    }
    
    
    
}
