package cn.cumtcdio.server.VO;

import javax.persistence.Column;

/**
 * @author SpringBoot Jun
 * @date 2019/5/21 19:53
 */
public class UserParams {
    private String username;
    @Column(name = "phone")
    private String phone;
    @Column(name = "qq_number")
    private String qqNumber;
    @Column(name = "family_address")
    private String familyAddress;
    @Column(name = "wx_number")
    private String wxNumber;
    @Column(name = "email")
    private String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQqNumber() {
        return qqNumber;
    }

    public void setQqNumber(String qqNumber) {
        this.qqNumber = qqNumber;
    }

    public String getFamilyAddress() {
        return familyAddress;
    }

    public void setFamilyAddress(String familyAddress) {
        this.familyAddress = familyAddress;
    }

    public String getWxNumber() {
        return wxNumber;
    }

    public void setWxNumber(String wxNumber) {
        this.wxNumber = wxNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
