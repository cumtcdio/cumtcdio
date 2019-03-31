package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.model.Show;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * ShowDAO继承基类
 */
public interface ShowMapper extends MyBatisBaseDao<Show, Integer> {

    List<Show> getAllShowByType(Integer type);

    Show getShowDetailsByShowId(Integer showId);
}