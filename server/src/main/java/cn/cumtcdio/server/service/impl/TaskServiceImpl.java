package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.mapper.GroupMapper;
import cn.cumtcdio.server.mapper.TaskMapper;
import cn.cumtcdio.server.mapper.TaskResultMapper;
import cn.cumtcdio.server.model.Group;
import cn.cumtcdio.server.model.Task;
import cn.cumtcdio.server.model.TaskResult;
import cn.cumtcdio.server.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    TaskMapper taskMapper;

    @Autowired
    TaskResultMapper taskResultMapper;

    @Autowired
    GroupMapper groupMapper;

    @Override
    @Transactional
    public Integer insertTask(Task task) {
        int result = 0;
        result += taskMapper.insertSelective(task);
        //查找该年级的所有项目组，为该年级每组增加一个task
        List<Group> groups = groupMapper.selectGroupInfoByGradeSn(task.getGradeSn());
        for (Group group: groups){
            TaskResult taskResult = new TaskResult();
            taskResult.setGroupId(group.getId());
            taskResult.setTaskId(task.getId());
            result += taskResultMapper.insertSelective(taskResult);
        }
        return result;
    }

    @Override
    @Transactional
    public Integer deleteTask(Integer taskId) {
        int result = 0;
        result += taskResultMapper.deleteByTaskId(taskId);
        result += taskMapper.deleteByPrimaryKey(taskId);
        return result;
    }
}
