package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.User;

import java.util.List;

/**
 * UserMapper继承基类
 */
public interface UserMapper extends MyBatisBaseDao<User, Integer> {
    List<String> getMembersByGroupId(Integer groupId);

    User selectByUserName(String username);

    User getUserInfoByUsername(String username);

    List<User> getStudentInfo();

    List<User> getTeacherInfo();

    List<User> getMemberInfoByGroupId(Integer groupId);
}