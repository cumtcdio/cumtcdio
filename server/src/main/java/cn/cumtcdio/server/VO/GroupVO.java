package cn.cumtcdio.server.VO;

import java.util.List;

public class GroupVO {

    private String gradeSn;

    private List<GroupInfoVO> groupInfoVOS;

    public String getGradeSn() {
        return gradeSn;
    }

    public void setGradeSn(String gradeSn) {
        this.gradeSn = gradeSn;
    }

    public List<GroupInfoVO> getGroupInfoVOS() {
        return groupInfoVOS;
    }

    public void setGroupInfoVOS(List<GroupInfoVO> groupInfoVOS) {
        this.groupInfoVOS = groupInfoVOS;
    }
}
