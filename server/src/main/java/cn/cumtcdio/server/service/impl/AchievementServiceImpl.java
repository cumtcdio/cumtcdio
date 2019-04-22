package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.mapper.AchievementAddressMapper;
import cn.cumtcdio.server.mapper.AchievementMapper;
import cn.cumtcdio.server.mapper.GroupMapper;
import cn.cumtcdio.server.model.Achievement;
import cn.cumtcdio.server.model.AchievementAddress;
import cn.cumtcdio.server.model.Group;
import cn.cumtcdio.server.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AchievementServiceImpl implements AchievementService {

    @Autowired
    AchievementMapper achievementMapper;

    @Autowired
    GroupMapper groupMapper;

    @Autowired
    AchievementAddressMapper achievementAddressMapper;

    @Override
    @Transactional
    public Integer insertAchievement(Achievement achievement) {
        int result = 0;
        result += achievementMapper.insertSelective(achievement);
        //查找该年级的所有项目组，为该年级每组增加一个achievement
        List<Group> groups = groupMapper.selectGroupInfoByGradeSn(achievement.getGradeSn());
        for (Group group: groups){
            AchievementAddress achievementAddress = new AchievementAddress();
            achievementAddress.setGroupId(group.getId());
            achievementAddress.setAchievementId(achievement.getId());
            result += achievementAddressMapper.insertSelective(achievementAddress);
        }
        return result;
    }

    @Override
    public Integer deleteAchievement(Integer achievementId) {
        int result = 0;
        result += achievementAddressMapper.deleteByAchievementId(achievementId);
        result += achievementMapper.deleteByPrimaryKey(achievementId);
        return result;
    }
}
