package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;
import java.util.List;

public class TeacherAchievementVO {

    private Integer achievementId;

    private String achievementName;

    private Date deadline;

    @JsonProperty(value = "groups")
    private List<TeacherResultVO> teacherResultVOS;

    public Integer getAchievementId() {
        return achievementId;
    }

    public void setAchievementId(Integer achievementId) {
        this.achievementId = achievementId;
    }

    public String getAchievementName() {
        return achievementName;
    }

    public void setAchievementName(String achievementName) {
        this.achievementName = achievementName;
    }

    public List<TeacherResultVO> getTeacherResultVOS() {
        return teacherResultVOS;
    }

    public void setTeacherResultVOS(List<TeacherResultVO> teacherResultVOS) {
        this.teacherResultVOS = teacherResultVOS;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}
