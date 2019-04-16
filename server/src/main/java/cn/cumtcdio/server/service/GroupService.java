package cn.cumtcdio.server.service;

import cn.cumtcdio.server.VO.GroupDetailVO;
import cn.cumtcdio.server.VO.GroupInfoVO;

import java.util.List;

public interface GroupService {

    List<GroupInfoVO> getAllGroupInfoByGradeSn(String gradeSn);

    GroupDetailVO getDetailByGroupId(Integer groupId);
}
