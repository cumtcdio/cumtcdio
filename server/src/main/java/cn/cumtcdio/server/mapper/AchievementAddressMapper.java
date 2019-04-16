package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.AchievementAddress;
import org.apache.ibatis.annotations.Param;

/**
 * AchievementAddressMapper继承基类
 */
public interface AchievementAddressMapper extends MyBatisBaseDao<AchievementAddress, Integer> {
    AchievementAddress selectByAchiIdAndGroupId(@Param("achievementId") Integer achievementId, @Param("groupId") Integer groupId);
}