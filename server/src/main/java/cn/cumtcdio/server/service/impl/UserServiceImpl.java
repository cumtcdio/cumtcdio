package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.UserBaseInfoVO;
import cn.cumtcdio.server.VO.UserInfoVO;
import cn.cumtcdio.server.VO.UserParams;
import cn.cumtcdio.server.mapper.GroupMapper;
import cn.cumtcdio.server.mapper.RoleMapper;
import cn.cumtcdio.server.mapper.UserMapper;
import cn.cumtcdio.server.model.Group;
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
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    @Autowired
    private GroupMapper groupMapper;

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
        userInfoVO.setId(user.getId());
        userInfoVO.setUsername(username);
        userInfoVO.setRealName(user.getRealName());
        if (user.getGroupId() == null) {
            userInfoVO.setGradeSn(null);
            userInfoVO.setGroupSn(null);
        }else {
            Group group = new Group();
            group = groupMapper.getGroupInfoByGroupId(user.getGroupId());
            userInfoVO.setGroupId(user.getGroupId());
            userInfoVO.setGroupSn(group.getGroupSn());
            userInfoVO.setGradeSn(group.getGradeSn());
        }
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
        try{
            Authentication authentication = authenticationManager.authenticate(upToken);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            UserDetails userDetails = userDetailsService.loadUserByUsername(username);
            return jwtTokenUtil.generateToken(userDetails);
        } catch (BadCredentialsException e){
            return "用户名或密码错误";
        }
    }

    @Override
    public String refreshToken(String oldToken) {
        if (!jwtTokenUtil.isTokenExpired(oldToken)) {
            return jwtTokenUtil.refreshToken(oldToken);
        }
        return "error";
    }

    @Override
    public List<UserBaseInfoVO> getStudentInfo(String grade) {
        String gradeSn = grade.substring(2);
        List<User> users = userMapper.getStudentInfo(gradeSn);
        List<UserBaseInfoVO> userBaseInfoVOS = new ArrayList<>();
        convertUserToUserBaseInfoVO(users, userBaseInfoVOS);
        return userBaseInfoVOS;
    }

    @Override
    public List<UserBaseInfoVO> getTeacherInfo() {
        List<User> users = userMapper.getTeacherInfo();
        List<UserBaseInfoVO> userBaseInfoVOS = new ArrayList<>();
        convertUserToUserBaseInfoVO(users, userBaseInfoVOS);
        return userBaseInfoVOS;
    }

    @Override
    public Integer completeUserInfo(UserParams userParams) {
        return userMapper.completeUserInfo(userParams);
    }

    @Override
    public Integer updatePassword(String username, String password) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String pw = passwordEncoder.encode(password);
        return userMapper.updatePassword(pw,username);
    }

    @Override
    public Integer isNotFirstCompleted(String username) {
        User user = userMapper.isNotFirstCompleted(username);
        Integer number = 0;
        if (user != null) {
            number = 1;
        }
        return number;
    }

    @Override
    public UserParams getUserParams(String username) {
        return userMapper.getUserParams(username);
    }

    private void convertUserToUserBaseInfoVO(List<User> users, List<UserBaseInfoVO> userBaseInfoVOS) {
        for (User user : users){
            UserBaseInfoVO userBaseInfoVO = new UserBaseInfoVO();
            userBaseInfoVO.setUserId(user.getId());
            userBaseInfoVO.setUsername(user.getUsername());
            userBaseInfoVO.setPhone(user.getPhone());
            userBaseInfoVO.setRealName(user.getRealName());
            userBaseInfoVO.setEmail(user.getEmail());
            userBaseInfoVO.setWxNumber(user.getWxNumber());
            userBaseInfoVO.setQqNumber(user.getQqNumber());
            userBaseInfoVO.setFamily_address(user.getFamilyAddress());
            if (user.getGroupId()!=null){
                Group group = groupMapper.selectByPrimaryKey(user.getGroupId());
                userBaseInfoVO.setGroupSn(group.getGroupSn());
            }
            userBaseInfoVOS.add(userBaseInfoVO);
        }
    }
}
