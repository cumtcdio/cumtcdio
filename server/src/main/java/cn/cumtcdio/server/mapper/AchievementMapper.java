package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Achievement;

import java.util.List;

/**
 * AchievementMapper继承基类
 */
public interface AchievementMapper extends MyBatisBaseDao<Achievement, Integer> {
    List<Achievement> selectByCourseId(Integer courseId);
}