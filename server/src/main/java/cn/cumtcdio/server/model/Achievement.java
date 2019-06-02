package cn.cumtcdio.server.model;

import java.io.Serializable;
import java.util.Date;

/**
 * achievement
 * @author 
 */
public class Achievement implements Serializable {
    /**
     * 结果id
     */
    private Integer id;

    /**
     * 课程id
     */
    private Integer courseId;

    /**
     * 结果名称例如、商业计划书
     */
    private String achievementName;

    /**
     * 年级
     */
    private String gradeSn;

    private Date deadLine;

    private Date time;

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(Date deadLine) {
        this.deadLine = deadLine;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getAchievementName() {
        return achievementName;
    }

    public void setAchievementName(String achievementName) {
        this.achievementName = achievementName;
    }

    public String getGradeSn() {
        return gradeSn;
    }

    public void setGradeSn(String gradeSn) {
        this.gradeSn = gradeSn;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Achievement other = (Achievement) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getCourseId() == null ? other.getCourseId() == null : this.getCourseId().equals(other.getCourseId()))
            && (this.getAchievementName() == null ? other.getAchievementName() == null : this.getAchievementName().equals(other.getAchievementName()))
            && (this.getGradeSn() == null ? other.getGradeSn() == null : this.getGradeSn().equals(other.getGradeSn()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCourseId() == null) ? 0 : getCourseId().hashCode());
        result = prime * result + ((getAchievementName() == null) ? 0 : getAchievementName().hashCode());
        result = prime * result + ((getGradeSn() == null) ? 0 : getGradeSn().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", courseId=").append(courseId);
        sb.append(", achievementName=").append(achievementName);
        sb.append(", gradeSn=").append(gradeSn);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}