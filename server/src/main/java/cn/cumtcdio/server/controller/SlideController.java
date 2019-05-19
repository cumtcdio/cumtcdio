package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.VO.SlideVO;
import cn.cumtcdio.server.model.Slide;
import cn.cumtcdio.server.service.SlideService;
import cn.cumtcdio.server.util.ResultVOUtil;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

/**
 * @author SpringBoot Jun
 * @date 2019/5/19 14:40
 */
@Controller
@Api(value = "SlideInterface",tags = "Slide",description = "轮播图接口")
@RequestMapping(value = "/api/slide")
@CrossOrigin
public class SlideController {
    @Autowired
    private SlideService slideService;

    @RequestMapping(value = "/insertSlide",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO insertSlide(@RequestBody SlideVO slideVo){
        return ResultVOUtil.success(slideService.insertSlide(slideVo));
    }

    @RequestMapping(value = "/updateSlideImg/{slideId}",method = RequestMethod.POST)
    @ResponseBody
    public ResultVO updateSlideImg(@PathVariable Integer slideId,
                                   @RequestParam(value = "file") MultipartFile file,HttpSession session){
        return ResultVOUtil.success(slideService.updateSlideImg(slideId,file));
    }

    @GetMapping(value = "/getSlideInfoBySlidId/{slideId}")
    @ResponseBody
    public ResultVO getSlideInfoBySlidId(@PathVariable Integer slideId){
        return ResultVOUtil.success(slideService.getSlideInfoBySlidId(slideId));
    }

    @PutMapping(value = "/updateSlide")
    @ResponseBody
    public ResultVO updateSlide(@RequestBody SlideVO slideVO){
        return ResultVOUtil.success(slideService.updateSlide(slideVO));
    }

    @DeleteMapping(value = "/deleteSlideById/{id}")
    @ResponseBody
    public ResultVO deleteSlideById(@PathVariable Integer id){
        return ResultVOUtil.success(slideService.deleteSlideById(id));
    }
}
