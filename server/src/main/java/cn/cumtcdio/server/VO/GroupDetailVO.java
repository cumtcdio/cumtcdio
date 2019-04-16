package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * 项目组详情信息
 * 包括项目基本信息，成员，项目过程管理，成绩等
 */
public class GroupDetailVO {

    private Integer groupId;

    private String groupSn;

    private String groupName;

    private String member;

    private String gradeSn;

    private String groupImg;

    private String teacher;

    /**
     * 项目概述
     */
    private String desc;

    private List<CourseVO> CCourseVOS;

    private List<CourseVO> DCourseVOS;

    private List<CourseVO> ICourseVOS;

    private List<CourseVO> OCourseVOS;

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

    public List<CourseVO> getCCourseVOS() {
        return CCourseVOS;
    }

    public void setCCourseVOS(List<CourseVO> CCourseVOS) {
        this.CCourseVOS = CCourseVOS;
    }

    public List<CourseVO> getDCourseVOS() {
        return DCourseVOS;
    }

    public void setDCourseVOS(List<CourseVO> DCourseVOS) {
        this.DCourseVOS = DCourseVOS;
    }

    public List<CourseVO> getICourseVOS() {
        return ICourseVOS;
    }

    public void setICourseVOS(List<CourseVO> ICourseVOS) {
        this.ICourseVOS = ICourseVOS;
    }

    public List<CourseVO> getOCourseVOS() {
        return OCourseVOS;
    }

    public void setOCourseVOS(List<CourseVO> OCourseVOS) {
        this.OCourseVOS = OCourseVOS;
    }
}
