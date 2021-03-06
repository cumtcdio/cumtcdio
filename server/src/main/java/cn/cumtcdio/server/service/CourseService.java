package cn.cumtcdio.server.service;

import cn.cumtcdio.server.VO.GradeCourseVO;
import cn.cumtcdio.server.VO.TeacherVO;
import cn.cumtcdio.server.form.CourseForm;

import java.util.List;

public interface CourseService {

    Integer insertCourse(CourseForm courseForm);

    Integer deleteCourse(Integer gradeId, Integer courseId);

    List<GradeCourseVO> getGradeCourseList();

    List<TeacherVO> getTeacherCourseInfoById(Integer teacherId);

    Integer achievementScore(Integer addressId,Integer score);

    Integer taskScore(Integer addressId, Integer score);
}
