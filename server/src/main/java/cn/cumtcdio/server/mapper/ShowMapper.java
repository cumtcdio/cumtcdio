package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.model.Show;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * ShowDAO继承基类
 */
public interface ShowMapper extends MyBatisBaseDao<Show, Integer> {

    List<Show> getAllShowByType(Integer type);

    Show getShowDetailsByShowId(Integer showId);

    Integer countOneTypeShowList(Integer type);

    List<Show> getShowListLazied(@Param(value = "type") Integer type,
                                 @Param(value = "offset") Integer offset);

    // 插入一条数据
    Integer insertShow(Show show);
    // 删除一条数据
    Integer deleteByShowId(Integer id);
    //根据title搜索数据
    List<Show> getShowListByShowTitleAndType(@Param(value = "title") String title,
                                             @Param(value = "type") Integer type);
}