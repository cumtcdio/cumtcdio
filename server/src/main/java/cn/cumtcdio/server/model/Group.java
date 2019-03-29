package cn.cumtcdio.server.model;

import java.io.Serializable;

/**
 * group
 * @author 
 */
public class Group implements Serializable {
    private Integer id;

    private String groupSn;

    /**
     * 项目名称
     */
    private String groupName;

    /**
     * 小组年级
     */
    private String gradeSn;

    /**
     * 项目小组的图片地址
     */
    private String groupImg;

    /**
     * 指导老师姓名
     */
    private String teacher;

    /**
     * 小组项目概要
     */
    private String desc;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGroupSn() {
        return groupSn;
    }

    public void setGroupSn(String groupSn) {
        this.groupSn = groupSn;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGradeSn() {
        return gradeSn;
    }

    public void setGradeSn(String gradeSn) {
        this.gradeSn = gradeSn;
    }

    public String getGroupImg() {
        return groupImg;
    }

    public void setGroupImg(String groupImg) {
        this.groupImg = groupImg;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
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
        Group other = (Group) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getGroupSn() == null ? other.getGroupSn() == null : this.getGroupSn().equals(other.getGroupSn()))
            && (this.getGroupName() == null ? other.getGroupName() == null : this.getGroupName().equals(other.getGroupName()))
            && (this.getGradeSn() == null ? other.getGradeSn() == null : this.getGradeSn().equals(other.getGradeSn()))
            && (this.getGroupImg() == null ? other.getGroupImg() == null : this.getGroupImg().equals(other.getGroupImg()))
            && (this.getTeacher() == null ? other.getTeacher() == null : this.getTeacher().equals(other.getTeacher()))
            && (this.getDesc() == null ? other.getDesc() == null : this.getDesc().equals(other.getDesc()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getGroupSn() == null) ? 0 : getGroupSn().hashCode());
        result = prime * result + ((getGroupName() == null) ? 0 : getGroupName().hashCode());
        result = prime * result + ((getGradeSn() == null) ? 0 : getGradeSn().hashCode());
        result = prime * result + ((getGroupImg() == null) ? 0 : getGroupImg().hashCode());
        result = prime * result + ((getTeacher() == null) ? 0 : getTeacher().hashCode());
        result = prime * result + ((getDesc() == null) ? 0 : getDesc().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", groupSn=").append(groupSn);
        sb.append(", groupName=").append(groupName);
        sb.append(", gradeSn=").append(gradeSn);
        sb.append(", groupImg=").append(groupImg);
        sb.append(", teacher=").append(teacher);
        sb.append(", desc=").append(desc);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}