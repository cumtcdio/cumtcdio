package cn.cumtcdio.server.form;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MemberForm {

    String sn;

    String name;

    @JsonProperty(value = "telephone")
    String phone;

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
