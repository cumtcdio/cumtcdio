package cn.cumtcdio.server.model;

import javax.persistence.Column;

/**
 * @author SpringBoot Jun
 * @date 2019/4/21 16:55
 */
public class RoutesRole {

    @Column(name = "routes_id")
    private Integer routesId;

    @Column(name = "role_id")
    private Integer roleId;

    public Integer getRoutesId() {
        return routesId;
    }

    public void setRoutesId(Integer routesId) {
        this.routesId = routesId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
