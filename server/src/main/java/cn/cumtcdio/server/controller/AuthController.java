package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.service.UserService;
import cn.cumtcdio.server.util.ResultVOUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author SpringBoot Jun
 * @date 2019/4/14 18:11
 */
@RestController
@CrossOrigin
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping(value = "${jwt.route.login}")
    public ResultVO<String> login(@RequestBody Map<String, String> map) {
        String username = map.get("username");
        String password = map.get("password");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return ResultVOUtil.error(401, "用户或者密码不能为空！");
        }
        return ResultVOUtil.success(userService.login(username, password));
    }

    @PostMapping(value = "${jwt.route.refresh}")
    public ResultVO<String> refresh(@RequestHeader("${jwt.header}") String token) {
        return ResultVOUtil.success(userService.refreshToken(token));
    }
}
