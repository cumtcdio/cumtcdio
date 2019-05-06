package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.TeacherVO;
import cn.cumtcdio.server.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 教师进行课程管理所需要的api
 */
@RequestMapping(value = "/api/course")
@RestController
@CrossOrigin
public class CourseController {

    @Autowired
    CourseService courseService;

    /**
     * 查找该老师所管理的课程
     * @param teacherId
     * @return
     */
    @GetMapping("/teacher/{teacherId}")
    public List<TeacherVO> getTeacherCourseInfo(@PathVariable Integer teacherId){
        return courseService.getTeacherCourseInfoById(teacherId);
    }

    @PutMapping("/score/achievement")
    public Integer achievementScore(@RequestParam Integer addressId,@RequestParam Integer score){
        return courseService.achievementScore(addressId,score);
    }

    @PutMapping("/score/task")
    public Integer taskScore(@RequestParam Integer addressId,@RequestParam Integer score){
        return courseService.taskScore(addressId,score);
    }

}
