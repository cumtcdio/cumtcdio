package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.User;

import java.util.List;

/**
 * UserMapper继承基类
 */
public interface UserMapper extends MyBatisBaseDao<User, Integer> {
    List<String> getMembersByGroupId(Integer groupId);

    List<User> selectAll();
}