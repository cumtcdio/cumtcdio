package cn.cumtcdio.server.form;

import java.util.List;

public class GroupForm {

    String gradeSn;

    String groupSn;

    String name;

    String teacher;

    String imgUrl;

    String desc;

    List<MemberForm> member;

    public String getGradeSn() {
        return gradeSn;
    }

    public void setGradeSn(String gradeSn) {
        this.gradeSn = gradeSn;
    }

    public String getGroupSn() {
        return groupSn;
    }

    public void setGroupSn(String groupSn) {
        this.groupSn = groupSn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public List<MemberForm> getMember() {
        return member;
    }

    public void setMember(List<MemberForm> member) {
        this.member = member;
    }
}
