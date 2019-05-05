package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.GroupDetailVO;
import cn.cumtcdio.server.VO.GroupInfoVO;
import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.model.Grade;
import cn.cumtcdio.server.service.GradeService;
import cn.cumtcdio.server.service.GroupService;
import cn.cumtcdio.server.util.ResultVOUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/api/group")
public class GroupController {

    @Autowired
    GroupService groupService;

    @Autowired
    private GradeService gradeService;

    /**
     * 获取所有的年级信息，当需要只取前两个时前端做出操作
     */
    @GetMapping(value = "/getAllGrades")
    @ApiOperation(value = "获取所有年级信息",response = Grade.class)
    public ResultVO getAllGrades(){
        return ResultVOUtil.success(gradeService.selectAllGrade());
    }

    /**
     * 通过年级sn查找出所有该年级的项目组的基本信息
     * @param gradeSn
     * @return
     */
    @GetMapping("/{gradeSn}")
    public ResultVO getAllGroupInfoByGradeSn(@PathVariable String gradeSn){
        List<GroupInfoVO> groupInfoVOS = groupService.getAllGroupInfoByGradeSn(gradeSn);
        return ResultVOUtil.success(groupInfoVOS);
    }

    @GetMapping("/id/{groupId}")
    public ResultVO getDetailByGroupId(@PathVariable Integer groupId){
        GroupDetailVO groupDetailVO = groupService.getDetailByGroupId(groupId);
        return ResultVOUtil.success(groupDetailVO);
    }

}
