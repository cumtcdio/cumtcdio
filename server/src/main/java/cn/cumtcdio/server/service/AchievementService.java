package cn.cumtcdio.server.service;

import cn.cumtcdio.server.model.Achievement;

public interface AchievementService {

    Integer insertAchievement(Achievement achievement);

    Integer deleteAchievement(Integer achievementId);
}
