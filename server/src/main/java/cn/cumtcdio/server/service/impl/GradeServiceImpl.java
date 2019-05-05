package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.mapper.GradeMapper;
import cn.cumtcdio.server.model.Grade;
import cn.cumtcdio.server.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    GradeMapper gradeMapper;

    @Override
    public List<Grade> selectAllGrade() {
        return gradeMapper.selectAllGrades();
    }

    @Override
    @Transactional
    public Integer insertGrade(String gradeSn) {
        Grade grade = new Grade();
        grade.setGradeSn(gradeSn);
        return gradeMapper.insertSelective(grade);
    }

    @Override
    @Transactional
    public Integer deleteGrade(Integer gradeId) {
        return gradeMapper.deleteByPrimaryKey(gradeId);
    }


}
