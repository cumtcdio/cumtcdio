package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.TaskResult;
import org.apache.ibatis.annotations.Param;

/**
 * TaskResultMapper继承基类
 */
public interface TaskResultMapper extends MyBatisBaseDao<TaskResult, Integer> {
    TaskResult selectByTaskIdAndGroupId(@Param("taskId") Integer taskId, @Param("groupId") Integer groupId);

    int deleteByTaskId(Integer taskId);
}