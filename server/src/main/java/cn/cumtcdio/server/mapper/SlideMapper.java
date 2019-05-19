package cn.cumtcdio.server.mapper;

import cn.cumtcdio.server.model.Slide;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface SlideMapper{

//    根据id查找轮播图
    Slide selectById(@Param("id") Integer id);

//    查找所有轮播图
    List<Slide> selectAll();

    // 添加一条slide数据
    Integer insertSlide(Slide slide);

    //添加图片地址到slide元组中
    Integer updateSlideImg(@Param("img") String img,
                           @Param("id") Integer id);

    Integer updateSlide(Slide slide);

    //删除一条数据
    Integer deleteSlideById(Integer id);
}