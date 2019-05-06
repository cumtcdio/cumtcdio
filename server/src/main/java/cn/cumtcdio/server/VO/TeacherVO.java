package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * 为老师返回课程信息的封装对象
 */
public class TeacherVO {

    private String gradeSn;

    @JsonProperty(value = "course")
    private List<TeacherCourseVO> courseVOS;

    public String getGradeSn() {
        return gradeSn;
    }

    public void setGradeSn(String gradeSn) {
        this.gradeSn = gradeSn;
    }

    public List<TeacherCourseVO> getCourseVOS() {
        return courseVOS;
    }

    public void setCourseVOS(List<TeacherCourseVO> courseVOS) {
        this.courseVOS = courseVOS;
    }
}
