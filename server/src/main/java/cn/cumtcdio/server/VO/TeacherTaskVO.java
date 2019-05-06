package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;
import java.util.List;

public class TeacherTaskVO {

    private Integer taskId;

    private String title;

    private String require;

    private String content;

    private Date time;

    private Date deadline;

    @JsonProperty(value = "groups")
    private List<TeacherResultVO> teacherResultVOS;

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRequire() {
        return require;
    }

    public void setRequire(String require) {
        this.require = require;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public List<TeacherResultVO> getTeacherResultVOS() {
        return teacherResultVOS;
    }

    public void setTeacherResultVOS(List<TeacherResultVO> teacherResultVOS) {
        this.teacherResultVOS = teacherResultVOS;
    }
}
