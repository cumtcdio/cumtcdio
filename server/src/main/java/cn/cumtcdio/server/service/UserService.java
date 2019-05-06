package cn.cumtcdio.server.service;

import cn.cumtcdio.server.VO.UserBaseInfoVO;
import cn.cumtcdio.server.VO.UserInfoVO;
import cn.cumtcdio.server.VO.UserVO;
import cn.cumtcdio.server.model.User;

import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/3/17 15:36
 */
public interface UserService{
    User selectByUserName(String username);

    /**
     * 获取用户详细信息
     * @param username
     * @return 操作结果
     */
    UserInfoVO findUserInfo(String username);

    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 操作结果
     */
    String login(String username, String password);

    /**
     * 刷新密钥
     *
     * @param oldToken 原密钥
     * @return 新密钥
     */
    String refreshToken(String oldToken);

    List<UserBaseInfoVO> getStudentInfo();

    List<UserBaseInfoVO> getTeacherInfo();
}
