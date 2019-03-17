package cn.cumtcdio.server.service;

import cn.cumtcdio.server.mapper.UserMapper;
import cn.cumtcdio.server.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/3/17 15:36
 */
@Service
public class UserService extends BaseService<UserMapper, User>{
    @Autowired
    private UserMapper userMapper;

    public List<User> getAllUser(){
        return userMapper.selectAll();
    }
}
