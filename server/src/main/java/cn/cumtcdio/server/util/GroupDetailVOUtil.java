package cn.cumtcdio.server.util;

import cn.cumtcdio.server.VO.AchievementVO;
import cn.cumtcdio.server.VO.CourseVO;
import cn.cumtcdio.server.VO.GroupDetailVO;
import cn.cumtcdio.server.VO.ProcessManageVO;
import cn.cumtcdio.server.mapper.*;
import cn.cumtcdio.server.model.*;
import com.google.common.base.Joiner;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class GroupDetailVOUtil {

    private static GroupMapper groupMapper;

    private static UserMapper userMapper;

    private static CourseGradeMapper courseGradeMapper;

    private static CourseMapper courseMapper;

    private static AchievementMapper achievementMapper;

    private static AchievementAddressMapper achievementAddressMapper;

    private static TaskMapper taskMapper;

    private static TaskResultMapper taskResultMapper;

    @Autowired
    public GroupDetailVOUtil(GroupMapper groupMapper,UserMapper userMapper,CourseGradeMapper courseGradeMapper,AchievementMapper achievementMapper,CourseMapper courseMapper
    ,AchievementAddressMapper achievementAddressMapper,TaskMapper taskMapper,TaskResultMapper taskResultMapper){
        this.groupMapper = groupMapper;
        this.userMapper = userMapper;
        this.courseGradeMapper = courseGradeMapper;
        this.achievementMapper = achievementMapper;
        this.courseMapper = courseMapper;
        this.achievementAddressMapper = achievementAddressMapper;
        this.taskMapper = taskMapper;
        this.taskResultMapper = taskResultMapper;
    }

    public static GroupDetailVO generate(Integer groupId){
        GroupDetailVO groupDetailVO = new GroupDetailVO();
        groupDetailVO.setGroupId(groupId);
        Group group = groupMapper.selectByPrimaryKey(groupId);
        groupDetailVO.setGroupName(group.getGroupName());
        groupDetailVO.setGradeSn(group.getGradeSn());
        groupDetailVO.setGroupSn(group.getGroupSn());
        groupDetailVO.setTeacher(group.getTeacher());
        groupDetailVO.setDesc(group.getDesc());
        groupDetailVO.setGroupImg(group.getGroupImg());
        //通过groupId查出所有成员
        List<String> members = userMapper.getMembersByGroupId(groupId);
        String memberString = Joiner.on("、").join(members);
        groupDetailVO.setMember(memberString);
        //找出所有该年级的课程
        List<Integer> courseIds = courseGradeMapper.getCourseIdsByGradeSn(group.getGradeSn());
        //课程分类
        List<Course> cCourses = new ArrayList<>();
        List<Course> dCourses = new ArrayList<>();
        List<Course> iCourses = new ArrayList<>();
        List<Course> oCourses = new ArrayList<>();
        for (Integer courseId: courseIds){
            Course course = courseMapper.selectByPrimaryKey(courseId);
            switch (course.getType()){
                case "C":
                    cCourses.add(course);
                    break;
                case "D":
                    dCourses.add(course);
                    break;
                case "I":
                    iCourses.add(course);
                    break;
                case "O":
                    oCourses.add(course);
                    break;
            }
        }
        groupDetailVO.setCCourseVOS(generateCourseVO(cCourses,group));
        groupDetailVO.setDCourseVOS(generateCourseVO(dCourses,group));
        groupDetailVO.setICourseVOS(generateCourseVO(iCourses,group));
        groupDetailVO.setOCourseVOS(generateCourseVO(oCourses,group));
        return groupDetailVO;
    }

    private static List<CourseVO> generateCourseVO(List<Course> courses, Group group){
        List<CourseVO> cCourseVOS = new ArrayList<>();
        for (Course course: courses){
            CourseVO courseVO = new CourseVO();
            courseVO.setCourseId(course.getId());
            courseVO.setCourseName(course.getName());
            //查找所有该年级该课程的所有achievement
            List<Achievement> achievements = achievementMapper.selectByCourseIdAndGradeSn(course.getId(),group.getGradeSn());
            List<AchievementVO> achievementVOS = new ArrayList<>();
            for (Achievement achievement: achievements){
                AchievementVO achievementVO = new AchievementVO();
                achievementVO.setAchievementId(achievement.getId());
                achievementVO.setName(achievement.getAchievementName());
                //查出该组该课程的成果address
                AchievementAddress achievementAddress = achievementAddressMapper.selectByAchiIdAndGroupId(achievement.getId(),group.getId());
                if (achievementAddress != null && StringUtils.isNotBlank(achievementAddress.getAddress())){
                    achievementVO.setAddress(achievementAddress.getAddress());
                    achievementVO.setAddressId(achievementAddress.getId());
                }
                achievementVOS.add(achievementVO);
            }
            courseVO.setAchievementVOS(achievementVOS);
            //根据courseId和grade_sn查找所有该课程的所有processManage (task)
            List<Task> tasks = taskMapper.selectByCourseIdAndGradeSn(course.getId(),group.getGradeSn());
            List<ProcessManageVO> processManageVOS = new ArrayList<>();
            for (Task task: tasks){
                ProcessManageVO processManageVO = new ProcessManageVO();
                processManageVO.setProcessId(task.getId());
                processManageVO.setTitle(task.getTitle());
                processManageVO.setRequire(task.getRequires());
                processManageVO.setContent(task.getDesc());
                processManageVO.setTime(task.getTime());
                //根据taskId和groupId查出address
                TaskResult taskResult = taskResultMapper.selectByTaskIdAndGroupId(task.getId(),group.getId());
                if(taskResult != null && StringUtils.isNotBlank(taskResult.getAddress())){
                    processManageVO.setAddress(taskResult.getAddress());
                    processManageVO.setAddressId(taskResult.getId());
                }
                processManageVOS.add(processManageVO);
            }
            courseVO.setProcessManageVOS(processManageVOS);
            cCourseVOS.add(courseVO);
        }
        return cCourseVOS;
    }

}
