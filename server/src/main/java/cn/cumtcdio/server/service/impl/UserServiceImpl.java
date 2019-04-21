package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.UserInfoVO;
import cn.cumtcdio.server.mapper.RoleMapper;
import cn.cumtcdio.server.mapper.UserMapper;
import cn.cumtcdio.server.model.Role;
import cn.cumtcdio.server.model.User;
import cn.cumtcdio.server.service.MenuService;
import cn.cumtcdio.server.service.UserService;
import cn.cumtcdio.server.util.token.JwtTokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/4/14 18:19
 */
@Service
public class UserServiceImpl implements UserService {

    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuService menuService;

    @Override
    public User selectByUserName(String username) {
        if (StringUtils.isEmpty(username)) {
            throw new UsernameNotFoundException("用户名不可以为空!");
        }
        User user = userMapper.selectByUserName(username);
        if (user == null || StringUtils.isEmpty((user.getId()) + "") || StringUtils.isEmpty(user.getUsername())) {
            throw new UsernameNotFoundException("用户名不存在!");
        }
        log.info("SysUserServiceImpl......... {}", user);
        return user;
    }

    @Override
    public UserInfoVO findUserInfo(String username) {
        UserInfoVO userInfoVO = new UserInfoVO();
        User user = userMapper.getUserInfoByUsername(username);
        userInfoVO.setUsername(username);
        userInfoVO.setRealName(user.getRealName());
        List<Role> roles = roleMapper.getRoleByUserId(user.getId());
        userInfoVO.setRoles(roles);
        int id = 0;
        for(Role role : roles) {
            id = role.getId();
        }
        userInfoVO.setRoutes(menuService.getRoutesByRoleId(id));
        return userInfoVO;
    }


    // 如果在WebSecurityConfigurerAdapter中，没有重新，这里就会报注入失败的异常
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public String login(String username, String password) {
        UsernamePasswordAuthenticationToken upToken = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authentication = authenticationManager.authenticate(upToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        return jwtTokenUtil.generateToken(userDetails);
    }

    @Override
    public String refreshToken(String oldToken) {
        if (!jwtTokenUtil.isTokenExpired(oldToken)) {
            return jwtTokenUtil.refreshToken(oldToken);
        }
        return "error";
    }
}
