package cn.cumtcdio.server.VO;

import cn.cumtcdio.server.model.Role;
import cn.cumtcdio.server.model.Routes;

import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/4/21 18:16
 */
public class UserInfoVO {

    private String username;

    private String realName;

    private List<Role> roles;

    private List<Routes> routes;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Routes> getRoutes() {
        return routes;
    }

    public void setRoutes(List<Routes> routes) {
        this.routes = routes;
    }
}
