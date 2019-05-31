package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.VO.UserParams;
import cn.cumtcdio.server.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * UserMapper继承基类
 */
public interface UserMapper extends MyBatisBaseDao<User, Integer> {
    List<String> getMembersByGroupId(Integer groupId);

    User selectByUserName(String username);

    User getUserInfoByUsername(String username);

    List<User> getStudentInfo(String grade);

    List<User> getTeacherInfo();

    List<User> getMemberInfoByGroupId(Integer groupId);

    Integer completeUserInfo(UserParams userParams);

    Integer updatePassword(@Param(value = "password") String password,
                           @Param(value = "username") String username);

    User isNotFirstCompleted(String username);

    UserParams getUserParams(String username);
}