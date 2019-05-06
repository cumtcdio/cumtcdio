package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.model.Show;
import cn.cumtcdio.server.service.ShowService;
import cn.cumtcdio.server.service.SlideService;
import cn.cumtcdio.server.util.ResultVOUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * @author SpringBoot Jun
 * @date 2019/3/31 17:21
 */
@RestController
@CrossOrigin
@RequestMapping(value = "/api/show")
@Api(value = "ShowInterface", tags = "Show", description = "新闻，通知同相关接口")
public class ShowController {
    @Autowired
    private ShowService showService;
    @Autowired
    private SlideService slideService;

    @RequestMapping(value = "/getAllShowByType/{type}", method = RequestMethod.GET)
    @ApiOperation(value = "通过类型获取相关的show列表",response = ShowInfoVO.class)
    public ResultVO getAllShowByType(@PathVariable Integer type) {
        return ResultVOUtil.success(showService.getAllShowInfoByType(type));
    }

    @RequestMapping(value = "/getShowDetailsByShowId/{showId}", method = RequestMethod.GET)
    @ApiOperation(value = "通过showId获取信息")
    public ResultVO getShowDetailsByShowId(@PathVariable Integer showId) {
        return ResultVOUtil.success(showService.getShowDetailsByShowId(showId));
    }

    @RequestMapping(value = "/getShowListLazied/{type}/{offset}", method = RequestMethod.GET)
    @ApiOperation(value = "通过type懒加载数据",response = ShowInfoVO.class)
    public ResultVO getShowListLazied(@PathVariable Integer type,
                                      @PathVariable Integer offset) {
        return ResultVOUtil.success(showService.getShowListLazied(type, offset));
    }

    @RequestMapping(value = "/countOneTypeShowList/{type}", method = RequestMethod.GET)
    @ApiOperation(value = "通过type获取list个数")
    public ResultVO countOneTypeShowList(@PathVariable(value = "type")Integer type) {
        return ResultVOUtil.success(showService.countOneTypeShowList(type));
    }

    /**
     * 插入一条数据
     */
    @RequestMapping(value = "/insertShow",method = RequestMethod.POST)
    @ApiOperation(value = "插入一条数据", response = Show.class)
    public ResultVO insertShow(@RequestBody Show show) throws IOException {
        return ResultVOUtil.success(showService.insertSelective(show));
    }

    /**
     * 删除一条数据
     */
    @RequestMapping(value = "/deleteByShowId/{id}", method = RequestMethod.DELETE)
    @ApiOperation(value = "删除一条数据")
    public ResultVO deleteByShowId(@PathVariable Integer id){
        return ResultVOUtil.success(showService.deleteByShowId(id));
    }

    /**
     * 根据ID更新一条数据
     */
    @RequestMapping(value = "/updateShowByShowId", method = RequestMethod.PUT)
    @ApiOperation(value = "根据ID更新一条数据")
    public ResultVO updateShowByShowId(@RequestBody Show show){
        return ResultVOUtil.success(showService.updateShowByShowId(show));
    }

    /**
     * 这是更新数据前的获取数据，需要进行Body内容的获取
     * @param id
     * @return
     */
    @RequestMapping(value = "/getUpdateShowByShowId/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "根据ID获取更新需要的数据",response = ShowInfoVO.class)
    public ResultVO getUpdateShowByShowId(@PathVariable Integer id) {
        return ResultVOUtil.success(showService.getUpdateShowByShowId(id));
    }

    /**
     * 根据title和type搜索数据
     */
    @RequestMapping(value = "/getShowListByShowTitleAndType/{title}/{type}", method = RequestMethod.GET)
    @ApiOperation(value = "根据title和type搜索数据", response = ShowInfoVO.class)
    public ResultVO getShowListByShowTitleAndType(@PathVariable(value = "title") String title,
                      @PathVariable(value = "type") Integer type){
        return ResultVOUtil.success(showService.getShowListByShowTitleAndType(title,type));
    }

//    @RequestMapping(value = "/getSlideById/{id}", method = RequestMethod.GET)
//    @ApiOperation(value = "通过id获取轮播图")
//    public ResultVO getSlideById(@PathVariable Integer id) {
//        return ResultVOUtil.success(slideService.selectById(id));
//    }

    @RequestMapping(value = "/getAllSlide", method = RequestMethod.GET)
    @ApiOperation(value = "获取所有轮播图")
    public ResultVO getAllSlide() {
        return ResultVOUtil.success(slideService.getAll());
    }

    @RequestMapping(value = "/getShowList2Lazied/{type}", method = RequestMethod.GET)
    @ApiOperation(value = "通过type懒加载前两条数据",response = ShowInfoVO.class)
    public ResultVO getShowList2Lazied(@PathVariable Integer type) {
        return ResultVOUtil.success(showService.getShowList2Lazied(type));
    }

}
