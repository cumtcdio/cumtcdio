package cn.cumtcdio.server.service;

import cn.cumtcdio.server.model.Grade;

import java.util.List;

public interface GradeService {

    List<Grade> selectAllGrade();

    Integer insertGrade(String gradeSn);

    Integer deleteGrade(Integer gradeId);
}
