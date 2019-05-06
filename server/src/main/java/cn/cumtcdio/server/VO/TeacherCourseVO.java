package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class TeacherCourseVO {

    private Integer courseId;

    private String courseName;

    @JsonProperty(value = "achievements")
    private List<TeacherAchievementVO> achievementVOS;

    @JsonProperty(value = "tasks")
    private List<TeacherTaskVO> taskVOS;

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

    public List<TeacherAchievementVO> getAchievementVOS() {
        return achievementVOS;
    }

    public void setAchievementVOS(List<TeacherAchievementVO> achievementVOS) {
        this.achievementVOS = achievementVOS;
    }

    public List<TeacherTaskVO> getTaskVOS() {
        return taskVOS;
    }

    public void setTaskVOS(List<TeacherTaskVO> taskVOS) {
        this.taskVOS = taskVOS;
    }
}
