package cn.cumtcdio.server.VO;

/**
 * 项目组详情类
 */
public class GroupInfoVO {

    Integer groupId;

    String groupSn;

    String groupName;

    String gradeSn;

    String groupImg;

    String teacher;

    String member;

    /**
     * 项目概述
     */
    String desc;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }
}
