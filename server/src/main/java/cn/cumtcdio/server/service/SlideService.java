package cn.cumtcdio.server.service;

import cn.cumtcdio.server.mapper.SlideMapper;
import cn.cumtcdio.server.model.Slide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SlideService {

      @Autowired
      private SlideMapper slideMapper;

////    根据id查找显示轮播图
//      public List<Slide> selectById(Integer id){
//            return slideMapper.selectById();
//      };

//    查找显示所有轮播图
      public List<Slide> getAll (){
            return slideMapper.selectAll();
      };

////    添加轮播图
//      public Integer insertSlide(Slide slide){
//
//      };

////     删除轮播图
//      public Integer deleteSlide(Integer id){
//
//      };
}
