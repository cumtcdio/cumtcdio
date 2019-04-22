package cn.cumtcdio.server.model;


import javax.persistence.Column;

/**
 * @author SpringBoot Jun
 * @date 2019/4/14 17:46
 */
public class MenuRole {

    @Column(name = "m_id")
    private Integer mId;

    @Column(name = "r_id")
    private Integer rId;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }
}
