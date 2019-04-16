package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.*;
import cn.cumtcdio.server.mapper.*;
import cn.cumtcdio.server.model.*;
import cn.cumtcdio.server.service.GroupService;
import cn.cumtcdio.server.util.GroupDetailVOUtil;
import com.google.common.base.Joiner;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GroupServiceImpl implements GroupService {

    @Autowired
    GroupMapper groupMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    CourseGradeMapper courseGradeMapper;

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    AchievementMapper achievementMapper;

    @Autowired
    AchievementAddressMapper achievementAddressMapper;

    @Autowired
    TaskMapper taskMapper;

    @Autowired
    TaskResultMapper taskResultMapper;

    @Override
    public List<GroupInfoVO> getAllGroupInfoByGradeSn(String gradeSn) {

        List<Group> groups = groupMapper.selectGroupInfoByGradeSn(gradeSn);
        List<GroupInfoVO> groupInfoVOS = new ArrayList<>();
        for (Group group: groups){
            GroupInfoVO groupInfoVO = new GroupInfoVO();
            BeanUtils.copyProperties(group, groupInfoVO);
            groupInfoVO.setGroupId(group.getId());
            groupInfoVOS.add(groupInfoVO);
        }

        return groupInfoVOS;
    }

    @Override
    public GroupDetailVO getDetailByGroupId(Integer groupId) {
        return GroupDetailVOUtil.generate(groupId);
    }

}
