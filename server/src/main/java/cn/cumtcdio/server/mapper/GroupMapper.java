package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Group;

import java.util.List;

/**
 * GroupMapper继承基类
 */
public interface GroupMapper extends MyBatisBaseDao<Group, Integer> {
    List<Group> selectGroupInfoByGradeSn(String gradeSn);

    Group getGroupInfoByGroupId(Integer groupId);
}