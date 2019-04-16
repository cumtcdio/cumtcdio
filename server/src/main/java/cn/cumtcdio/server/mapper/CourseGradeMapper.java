package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.CourseGradeKey;

import java.util.List;

/**
 * CourseGradeMapper继承基类
 */
public interface CourseGradeMapper extends MyBatisBaseDao<CourseGradeKey, CourseGradeKey> {

    List<Integer> getCourseIdsByGradeSn(String gradeSn);

}