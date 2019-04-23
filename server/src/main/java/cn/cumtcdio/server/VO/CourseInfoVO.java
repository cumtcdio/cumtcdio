package cn.cumtcdio.server.VO;

import cn.cumtcdio.server.model.Achievement;
import cn.cumtcdio.server.model.Task;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class CourseInfoVO {

    private Integer courseId;

    private String courseName;

    @JsonProperty(value = "achievement")
    private List<Achievement> achievements;

    @JsonProperty(value = "processManage")
    private List<Task> tasks;

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

    public List<Achievement> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<Achievement> achievements) {
        this.achievements = achievements;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }
}
