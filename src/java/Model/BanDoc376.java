/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class BanDoc376 extends NguoiDung376{
    private TheBanDoc376 theBanDoc;

    public BanDoc376(TheBanDoc376 theBanDoc, int id, String tenDangNhap, String matKhau, String hoTen, String sdt, String email, String diaChi, String vaiTro) {
        super(id, tenDangNhap, matKhau, hoTen, sdt, email, diaChi, vaiTro);
        this.theBanDoc = theBanDoc;
    }

    public TheBanDoc376 getTheBanDoc() {
        return theBanDoc;
    }

    public void setTheBanDoc(TheBanDoc376 theBanDoc) {
        this.theBanDoc = theBanDoc;
    }
    
    
}
