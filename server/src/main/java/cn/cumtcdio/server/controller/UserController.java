package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.service.UserService;
import cn.cumtcdio.server.util.ResultVOUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author SpringBoot Jun
 * @date 2019/3/17 15:35
 */
@RequestMapping(value = "/api/user")
@RestController
@Api(value = "/api/user", tags = "UserInterface", description = "用户接口")
@CrossOrigin
public class UserController {
    @Autowired
    private UserService userService;

    @ApiOperation(value = "通过userName获取前台所需存储用户信息")
    @GetMapping(value = "/getUserInfoByUsername/{username}")
    public ResultVO getUserInfoByUsername(@PathVariable String username){
        return ResultVOUtil.success(userService.findUserInfo(username));
    }

}
