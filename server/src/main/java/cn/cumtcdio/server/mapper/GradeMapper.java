package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Grade;

import java.util.List;

/**
 * GradeMapper继承基类
 */
public interface GradeMapper extends MyBatisBaseDao<Grade, Integer> {
    List<Grade> selectAllGrades();
}