package cn.cumtcdio.server.model;

import javax.persistence.Column;

/**
 * @author SpringBoot Jun
 * @date 2019/4/14 17:47
 */
public class UserRole {
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "role_id")
    private Integer roleId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
