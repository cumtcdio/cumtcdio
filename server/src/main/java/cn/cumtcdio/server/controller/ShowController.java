package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.VO.ResultVO;
import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.service.ShowService;
import cn.cumtcdio.server.util.ResultVOUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
}
