package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.CourseInfoVO;
import cn.cumtcdio.server.VO.GradeCourseVO;
import cn.cumtcdio.server.form.CourseForm;
import cn.cumtcdio.server.mapper.*;
import cn.cumtcdio.server.model.*;
import cn.cumtcdio.server.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseMapper courseMapper;

    @Autowired
    CourseGradeMapper courseGradeMapper;

    @Autowired
    GradeMapper gradeMapper;

    @Autowired
    AchievementMapper achievementMapper;

    @Autowired
    TaskMapper taskMapper;

    @Override
    @Transactional
    public Integer insertCourse(CourseForm courseForm) {
        Integer result = 0;

        //查询是否存在该课程
        Course course2 = courseMapper.selectByCourseNameAndCourseType(courseForm.getCourseName(),courseForm.getCourseType());
        if (course2 == null){
            Course course = new Course();
            course.setName(courseForm.getCourseName());
            course.setType(courseForm.getCourseType());
            result += courseMapper.insertSelective(course);
            CourseGradeKey courseGradeKey = new CourseGradeKey();
            courseGradeKey.setCourseId(course.getId());
            String gradeSn = gradeMapper.selectByPrimaryKey(courseForm.getGradeId()).getGradeSn();
            courseGradeKey.setGradeSn(gradeSn);
            result += courseGradeMapper.insertSelective(courseGradeKey);
        }else {
            CourseGradeKey courseGradeKey = new CourseGradeKey();
            courseGradeKey.setCourseId(course2.getId());
            String gradeSn = gradeMapper.selectByPrimaryKey(courseForm.getGradeId()).getGradeSn();
            courseGradeKey.setGradeSn(gradeSn);
            result += courseGradeMapper.insertSelective(courseGradeKey);
        }
        return result;
    }

    @Override
    @Transactional
    public Integer deleteCourse(Integer gradeId, Integer courseId) {
        // todo 未判断该课程是否可删除
        CourseGradeKey courseGradeKey = new CourseGradeKey();
        courseGradeKey.setCourseId(courseId);
        String gradeSn = gradeMapper.selectByPrimaryKey(gradeId).getGradeSn();
        courseGradeKey.setGradeSn(gradeSn);
        return courseGradeMapper.deleteByPrimaryKey(courseGradeKey);
    }

    @Override
    public List<GradeCourseVO> getGradeCourseList() {
        List<GradeCourseVO> gradeCourseVOS = new ArrayList<>();
        //查出所有年级
        List<Grade> grades = gradeMapper.selectAllGrades();
        for (Grade grade: grades){
            GradeCourseVO gradeCourseVO = new GradeCourseVO();
            gradeCourseVO.setGradeId(grade.getId());
            gradeCourseVO.setGradeSn(grade.getGradeSn());
            List<CourseInfoVO> cCourseInfoVOS = new ArrayList<>();
            List<CourseInfoVO> dCourseInfoVOS = new ArrayList<>();
            List<CourseInfoVO> iCourseInfoVOS = new ArrayList<>();
            List<CourseInfoVO> oCourseInfoVOS = new ArrayList<>();
            //根据gradeSn查出所有课程
            List<Integer> courseIds = courseGradeMapper.getCourseIdsByGradeSn(grade.getGradeSn());
            List<Course> cCourses = new ArrayList<>();
            List<Course> dCourses = new ArrayList<>();
            List<Course> iCourses = new ArrayList<>();
            List<Course> oCourses = new ArrayList<>();
            for (Integer courseId: courseIds){
                Course course = courseMapper.selectByPrimaryKey(courseId);
                switch (course.getType()){
                    case "C":
                        cCourses.add(course);
                        break;
                    case "D":
                        dCourses.add(course);
                        break;
                    case "I":
                        iCourses.add(course);
                        break;
                    case "O":
                        oCourses.add(course);
                        break;
                }
            }
            gradeCourseVO.setcCourseInfoVOS(generateCourseInfoVOS(cCourseInfoVOS,cCourses ,grade ));
            gradeCourseVO.setdCourseInfoVOS(generateCourseInfoVOS(dCourseInfoVOS,dCourses ,grade ));
            gradeCourseVO.setiCourseInfoVOS(generateCourseInfoVOS(iCourseInfoVOS,iCourses ,grade ));
            gradeCourseVO.setoCourseInfoVOS(generateCourseInfoVOS(oCourseInfoVOS,oCourses ,grade ));
            gradeCourseVOS.add(gradeCourseVO);
        }
        return gradeCourseVOS;
    }

    private List<CourseInfoVO> generateCourseInfoVOS(List<CourseInfoVO> courseInfoVOS, List<Course> courses,Grade grade){
        for (Course course : courses){
            //根据courseId和gradeSn 查出所有achievement和task
            List<Achievement> achievements = achievementMapper.selectByCourseIdAndGradeSn(course.getId(),grade.getGradeSn() );
            List<Task> tasks = taskMapper.selectByCourseIdAndGradeSn(course.getId(),grade.getGradeSn() );
            CourseInfoVO courseInfoVO = new CourseInfoVO();
            courseInfoVO.setCourseId(course.getId());
            courseInfoVO.setCourseName(courseMapper.selectByPrimaryKey(course.getId()).getName());
            courseInfoVO.setAchievements(achievements);
            courseInfoVO.setTasks(tasks);
            courseInfoVOS.add(courseInfoVO);
        }
        return courseInfoVOS;
    }

}
