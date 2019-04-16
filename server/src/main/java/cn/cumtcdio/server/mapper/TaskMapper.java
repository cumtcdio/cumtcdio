package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * TaskMapper继承基类
 */
public interface TaskMapper extends MyBatisBaseDao<Task, Integer> {
    List<Task> selectByCourseIdAndGradeSn(@Param("courseId") Integer courseId, @Param("gradeSn") String gradeSn);
}