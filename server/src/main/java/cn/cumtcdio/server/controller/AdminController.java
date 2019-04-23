package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.GradeCourseVO;
import cn.cumtcdio.server.form.CourseForm;
import cn.cumtcdio.server.model.Achievement;
import cn.cumtcdio.server.model.Task;
import cn.cumtcdio.server.service.AchievementService;
import cn.cumtcdio.server.service.CourseService;
import cn.cumtcdio.server.service.GradeService;
import cn.cumtcdio.server.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/api/admin")
public class AdminController {

    @Autowired
    CourseService courseService;

    @Autowired
    GradeService gradeService;

    @Autowired
    AchievementService achievementService;

    @Autowired
    TaskService taskService;

    @GetMapping("/gradeCourse")
    public List<GradeCourseVO> getGradeCourseList(){
        return courseService.getGradeCourseList();
    }

    /**
     * 增加一个年级
     * @param gradeSn
     * @return
     */
    @PostMapping("/grade/insert")
    public Integer insertGrade(@RequestParam String gradeSn){
        return gradeService.insertGrade(gradeSn);
    }

    /**
     * 删除某个年级
     * @param gradeId
     * @return
     */
    @DeleteMapping("/grade/delete")
    public Integer deleteGrade(@RequestParam Integer gradeId){
        return gradeService.deleteGrade(gradeId);
    }

    /**
     * 为某个年级增加某类型（C、D、I、O）的课程
     * @param courseForm
     * @return
     */
    @PostMapping("/course/insert")
    public Integer insertCourse(@RequestBody CourseForm courseForm){
        return courseService.insertCourse(courseForm);
    }

    /**
     * 删除某年级的某课程
     * @param gradeId
     * @param courseId
     * @return
     */
    @DeleteMapping("/course/delete")
    public Integer deleteCourse(@RequestParam Integer gradeId,@RequestParam Integer courseId){
        return courseService.deleteCourse(gradeId,courseId);
    }

    /**
     * 为某年级某课程添加achievement
     * @param achievement
     * @return
     */
    @PostMapping("/achievement/insert")
    public Integer insertAchievement(@RequestBody Achievement achievement){
        return achievementService.insertAchievement(achievement);
    }

    /**
     * 根据id删除achievement
     * @param achievementId
     * @return
     */
    @DeleteMapping("achievement/delete")
    public Integer deleteAchievement(@RequestParam Integer achievementId){
        return achievementService.deleteAchievement(achievementId);
    }

    /**
     * 给某年级的某课程发布任务
     * @param task
     * @return
     */
    @PostMapping("/task/insert")
    public Integer insertTask(@RequestBody Task task){
        return taskService.insertTask(task);
    }

    @DeleteMapping("task/delete")
    public Integer deleteTask(@RequestParam Integer taskId){
        return taskService.deleteTask(taskId);
    }
}
