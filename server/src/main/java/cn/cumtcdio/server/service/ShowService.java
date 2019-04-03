package cn.cumtcdio.server.service;

import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.model.Show;

import java.io.IOException;
import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/3/31 17:12
 */
public interface ShowService {

    List<ShowInfoVO> getAllShowInfoByType(Integer type);

    ShowInfoVO getShowDetailsByShowId(Integer id);

    Integer countOneTypeShowList(Integer type);

    List<ShowInfoVO> getShowListLazied(Integer type, Integer offset);

    //插入一条show数据
    Integer insertSelective(Show show) throws IOException;
}
