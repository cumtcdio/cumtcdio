package cn.cumtcdio.server.mapper;


import cn.cumtcdio.server.model.Role;
import cn.cumtcdio.server.util.MyMapper;

import java.util.List;

public interface RoleMapper extends MyMapper<Role> {
    /**
     * 通过用户编号userSn获取角色信息
     */
    List<Role> getRoleByUserId(Integer userId);

    /**
     * 获取所有角色信息
     */
    List<Role> getAllRole();
}