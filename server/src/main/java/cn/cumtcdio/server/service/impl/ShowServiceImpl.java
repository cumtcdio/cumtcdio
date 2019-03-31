package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.mapper.ShowMapper;
import cn.cumtcdio.server.model.Show;
import cn.cumtcdio.server.service.ShowService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author SpringBoot Jun
 * @date 2019/3/31 17:18
 */
@Service
public class ShowServiceImpl implements ShowService {
    @Autowired
    private ShowMapper showMapper;

    @Override
    public List<ShowInfoVO> getAllShowInfoByType(Integer type) {
        List<Show> showList = showMapper.getAllShowByType(type);
        List<ShowInfoVO> showInfoVOS = new ArrayList<>();
        for (Show show : showList){
            ShowInfoVO showInfoVO = new ShowInfoVO();
            BeanUtils.copyProperties(show, showInfoVO);
            showInfoVO.setShowId(show.getId());
            showInfoVO.setDateTime(dateFormat(show.getDateTime()));
            showInfoVOS.add(showInfoVO);
        }
        return showInfoVOS;
    }

    @Override
    public ShowInfoVO getShowDetailsByShowId(Integer id) {
        Show show = showMapper.getShowDetailsByShowId(id);
        ShowInfoVO showInfoVO = new ShowInfoVO();
        BeanUtils.copyProperties(show, showInfoVO);
        showInfoVO.setShowId(show.getId());
        showInfoVO.setDateTime(dateFormat(show.getDateTime()));
        return showInfoVO;
    }

    public String dateFormat(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateTime = format.format(date);
        return dateTime;
    }
}
