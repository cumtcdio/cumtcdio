package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Course;
import org.apache.ibatis.annotations.Param;

/**
 * CourseMapper继承基类
 */
public interface CourseMapper extends MyBatisBaseDao<Course, Integer> {
    Course selectByCourseNameAndCourseType(@Param("courseName") String courseName, @Param("courseType")String courseType);
}