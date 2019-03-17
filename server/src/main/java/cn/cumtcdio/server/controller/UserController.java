package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.model.User;
import cn.cumtcdio.server.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author SpringBoot Jun
 * @date 2019/3/17 15:35
 */
@RequestMapping(value = "/api/user")
@RestController
@Api(value = "/api/user", tags = "UserInterface", description = "用户接口")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取所有用户信息", response = User.class)
    public ResponseEntity getAllUser(){
        return ResponseEntity.ok(userService.getAllUser());
    }
}
