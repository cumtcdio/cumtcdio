package cn.cumtcdio.server.VO;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

/**
 * 为管理员提供所有年级课程基本信息
 */
public class GradeCourseVO {

    private Integer gradeId;

    private String gradeSn;

    @JsonProperty(value = "cCourses")
    private List<CourseInfoVO> cCourseInfoVOS;

    @JsonProperty(value = "dCourses")
    private List<CourseInfoVO> dCourseInfoVOS;

    @JsonProperty(value = "iCourses")
    private List<CourseInfoVO> iCourseInfoVOS;

    @JsonProperty(value = "oCourses")
    private List<CourseInfoVO> oCourseInfoVOS;

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getGradeSn() {
        return gradeSn;
    }

    public void setGradeSn(String gradeSn) {
        this.gradeSn = gradeSn;
    }

    public List<CourseInfoVO> getcCourseInfoVOS() {
        return cCourseInfoVOS;
    }

    public void setcCourseInfoVOS(List<CourseInfoVO> cCourseInfoVOS) {
        this.cCourseInfoVOS = cCourseInfoVOS;
    }

    public List<CourseInfoVO> getdCourseInfoVOS() {
        return dCourseInfoVOS;
    }

    public void setdCourseInfoVOS(List<CourseInfoVO> dCourseInfoVOS) {
        this.dCourseInfoVOS = dCourseInfoVOS;
    }

    public List<CourseInfoVO> getiCourseInfoVOS() {
        return iCourseInfoVOS;
    }

    public void setiCourseInfoVOS(List<CourseInfoVO> iCourseInfoVOS) {
        this.iCourseInfoVOS = iCourseInfoVOS;
    }

    public List<CourseInfoVO> getoCourseInfoVOS() {
        return oCourseInfoVOS;
    }

    public void setoCourseInfoVOS(List<CourseInfoVO> oCourseInfoVOS) {
        this.oCourseInfoVOS = oCourseInfoVOS;
    }
}
