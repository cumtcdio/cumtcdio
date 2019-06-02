package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.*;
import cn.cumtcdio.server.form.GroupForm;
import cn.cumtcdio.server.form.MemberForm;
import cn.cumtcdio.server.mapper.*;
import cn.cumtcdio.server.model.*;
import cn.cumtcdio.server.service.GroupService;
import cn.cumtcdio.server.util.GroupDetailVOUtil;
import com.google.common.base.Joiner;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class GroupServiceImpl implements GroupService {

    @Autowired
    GradeMapper gradeMapper;

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
            //通过groupId查出所有成员
            List<String> members = userMapper.getMembersByGroupId(group.getId());
            String memberString = Joiner.on("、").join(members);
            groupInfoVO.setMember(memberString);
            groupInfoVO.setGroupId(group.getId());
            groupInfoVOS.add(groupInfoVO);
        }

        return groupInfoVOS;
    }

    @Override
    public GroupDetailVO getDetailByGroupId(Integer groupId) {
        return GroupDetailVOUtil.generate(groupId);
    }

    @Override
    public List<GroupVO> getAll() {
        List<GroupVO> groupVOS = new ArrayList<>();
        List<Grade> grades = gradeMapper.selectAllGrades();
        for (Grade grade: grades){
            GroupVO groupVO = new GroupVO();
            groupVO.setGradeSn(grade.getGradeSn());
            groupVO.setGroupInfoVOS(getAllGroupInfoByGradeSn(grade.getGradeSn()));
            groupVOS.add(groupVO);
        }
        return groupVOS;
    }

    @Override
    public GroupDetailVO getDetailByGradeSnAndGroupSn(String gradeSn, String groupSn) {
        Integer groupId = groupMapper.selectIdByGradeSnAndGroupSn(gradeSn,groupSn);
        return GroupDetailVOUtil.generate(groupId);
    }

    @Override
    public List<User> getMemberInfoByGroupId(Integer groupId) {
        return userMapper.getMemberInfoByGroupId(groupId);
    }

    @Override
    @Transactional
    public Integer insertGroup(GroupForm groupForm) {
        int result = 0;
        Group group = new Group();
        group.setDesc(groupForm.getDesc());
        group.setGradeSn(groupForm.getGradeSn());
        group.setGroupImg(groupForm.getImgUrl());
        group.setGroupName(groupForm.getName());
        group.setGroupSn(groupForm.getGroupSn());
        group.setTeacher(groupForm.getTeacher());
        result += groupMapper.insertSelective(group);
        result += updateMemberSn(groupForm, group);
        return result;
    }

    @Override
    @Transactional
    public Integer updateGroup(GroupForm groupForm) {
        int result = 0;
        Group group = new Group();
        group.setId(groupMapper.selectIdByGradeSnAndGroupSn(groupForm.getGradeSn(),groupForm.getGroupSn()));
        group.setDesc(groupForm.getDesc());
        group.setGradeSn(groupForm.getGradeSn());
        group.setGroupImg(groupForm.getImgUrl());
        group.setGroupName(groupForm.getName());
        group.setGroupSn(groupForm.getGroupSn());
        group.setTeacher(groupForm.getTeacher());
        result += groupMapper.updateByPrimaryKeySelective(group);
        result += updateMemberSn(groupForm, group);
        return result;
    }

    @Override
    @Transactional
    public Integer uploadAchievement(Integer addressId,String address) {
        //判断是否已经截止
        AchievementAddress aa = achievementAddressMapper.selectByPrimaryKey(addressId);
        Achievement achievement = achievementMapper.selectByPrimaryKey(aa.getAchievementId());
        Date now = new Date();
        if (now.before(achievement.getDeadLine())){
            AchievementAddress achievementAddress = new AchievementAddress();
            achievementAddress.setId(addressId);
            achievementAddress.setAddress(address);
            return achievementAddressMapper.updateByPrimaryKeySelective(achievementAddress);
        }else {
            return 0;
        }

    }

    @Override
    public Integer uploadTask(Integer addressId, String address) {
        //判断是否已经截止
        TaskResult tr = taskResultMapper.selectByPrimaryKey(addressId);
        Task task = taskMapper.selectByPrimaryKey(tr.getTaskId());
        Date now = new Date();
        if (now.before(task.getDeadLine())){
            TaskResult taskResult = new TaskResult();
            taskResult.setId(addressId);
            taskResult.setAddress(address);
            return taskResultMapper.updateByPrimaryKeySelective(taskResult);
        }else {
            return 0;
        }

    }

    private int updateMemberSn(GroupForm groupForm, Group group) {
        int result = 0;
        for (MemberForm memberForm: groupForm.getMember()){
            User user = new User();
            //通过学号查找id
            int userId = userMapper.getUserInfoByUsername(memberForm.getSn()).getId();
            user.setId(userId);
            user.setGroupId(group.getId());
            result += userMapper.updateByPrimaryKeySelective(user);
        }
        return result;
    }

}
