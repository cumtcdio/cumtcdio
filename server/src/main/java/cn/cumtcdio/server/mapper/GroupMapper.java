package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Group;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * GroupMapper继承基类
 */
public interface GroupMapper extends MyBatisBaseDao<Group, Integer> {
    List<Group> selectGroupInfoByGradeSn(String gradeSn);

    Group getGroupInfoByGroupId(Integer groupId);

    Integer selectIdByGradeSnAndGroupSn(@Param("gradeSn") String gradeSn, @Param("groupSn") String groupSn);
}