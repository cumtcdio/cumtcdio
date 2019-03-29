package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.GroupInfoVO;
import cn.cumtcdio.server.mapper.GroupMapper;
import cn.cumtcdio.server.model.Group;
import cn.cumtcdio.server.service.GroupService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GroupServiceImpl implements GroupService {

    @Autowired
    GroupMapper groupMapper;

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

}
