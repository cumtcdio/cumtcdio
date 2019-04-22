package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Achievement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AchievementMapper继承基类
 */
public interface AchievementMapper extends MyBatisBaseDao<Achievement, Integer> {
    List<Achievement> selectByCourseIdAndGradeSn(@Param("courseId") Integer courseId, @Param("gradeSn") String gradeSn);
}