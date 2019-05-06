package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.CourseGradeKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CourseGradeMapper继承基类
 */
public interface CourseGradeMapper extends MyBatisBaseDao<CourseGradeKey, CourseGradeKey> {

    List<Integer> getCourseIdsByGradeSn(String gradeSn);

    List<Integer> getCourseIdsByGradeSnAndTeacherId(@Param(value = "gradeSn") String gradeSn, @Param(value = "teacherId") Integer teacherId);
}