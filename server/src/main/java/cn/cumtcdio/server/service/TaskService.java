package cn.cumtcdio.server.service;

import cn.cumtcdio.server.model.Task;

public interface TaskService {

    Integer insertTask(Task task);

    Integer deleteTask(Integer taskId);
}
