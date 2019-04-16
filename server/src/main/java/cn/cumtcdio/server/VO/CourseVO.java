package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class CourseVO {

    private Integer courseId;

    private String courseName;

    @JsonProperty(value = "achievement")
    private List<AchievementVO> achievementVOS;

    @JsonProperty(value = "processManage")
    private List<ProcessManageVO> processManageVOS;

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public List<AchievementVO> getAchievementVOS() {
        return achievementVOS;
    }

    public void setAchievementVOS(List<AchievementVO> achievementVOS) {
        this.achievementVOS = achievementVOS;
    }

    public List<ProcessManageVO> getProcessManageVOS() {
        return processManageVOS;
    }

    public void setProcessManageVOS(List<ProcessManageVO> processManageVOS) {
        this.processManageVOS = processManageVOS;
    }
}
