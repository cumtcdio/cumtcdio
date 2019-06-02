package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.VO.UserParams;
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

    @ApiOperation(value = "通过username完善用户信息")
    @PostMapping(value = "/completeUserInfo")
    public ResultVO completeUserInfo(@RequestBody UserParams userParams){
        return ResultVOUtil.success(userService.completeUserInfo(userParams));
    }

    @ApiOperation(value = "修改用户密码")
    @PostMapping(value = "/updatePassword/{username}/{password}")
    public ResultVO updatePassword(@PathVariable String username,
                                     @PathVariable String password){
        return ResultVOUtil.success(userService.updatePassword(username,password));
    }

    @GetMapping(value = "/isNotFirstCompleted/{username}")
    public ResultVO isNotFirstCompleted(@PathVariable String username){
        return ResultVOUtil.success(userService.isNotFirstCompleted(username));
    }

    @GetMapping(value = "/getUserParams/{username}")
    public ResultVO getUserParams(@PathVariable String username){
        return ResultVOUtil.success(userService.getUserParams(username));
    }

    @GetMapping(value = "/student/info/{grade}")
    public ResultVO getStudentInfo(@PathVariable String grade){
        return ResultVOUtil.success(userService.getStudentInfo(grade));
    }

    @GetMapping(value = "/teacher/info")
    public ResultVO getTeacherInfo(){
        return ResultVOUtil.success(userService.getTeacherInfo());
    }

}
