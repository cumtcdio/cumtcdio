package cn.cumtcdio.server.service;

import cn.cumtcdio.server.VO.GroupDetailVO;
import cn.cumtcdio.server.VO.GroupInfoVO;
import cn.cumtcdio.server.VO.GroupVO;
import cn.cumtcdio.server.model.User;

import java.util.List;

public interface GroupService {

    List<GroupInfoVO> getAllGroupInfoByGradeSn(String gradeSn);

    GroupDetailVO getDetailByGroupId(Integer groupId);

    List<GroupVO> getAll();

    GroupDetailVO getDetailByGradeSnAndGroupSn(String gradeSn, String groupSn);

    List<User> getMemberInfoByGroupId(Integer groupId);
}
