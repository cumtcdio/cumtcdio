package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.mapper.UserMapper;
import cn.cumtcdio.server.model.JwtUser;
import cn.cumtcdio.server.model.Role;
import cn.cumtcdio.server.model.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author SpringBoot Jun
 * @date 2019/4/14 17:32
 */
@Service
public class JwtUserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 根据用户名获取数据库的用户信息
        User user = userMapper.selectByUserName(username);
        if (user == null || StringUtils.isEmpty(user.getId() + "")){
            throw new UsernameNotFoundException(String.format("'%s'.这个用户不存在", username));
        } else {
            // 根据数据库中的用户信息，构建JwtUser对象
            List<SimpleGrantedAuthority> collect = user.getRoleList().stream().map(Role::getRoleType).map(SimpleGrantedAuthority::new).collect(Collectors.toList());
            return new JwtUser(user.getUsername(), user.getPassword(), user.getState(), collect);
        }
    }
}
