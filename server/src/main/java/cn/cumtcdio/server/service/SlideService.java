package cn.cumtcdio.server.service;

import cn.cumtcdio.server.VO.SlideVO;
import cn.cumtcdio.server.mapper.SlideMapper;
import cn.cumtcdio.server.model.Slide;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

@Service
public class SlideService {

      @Autowired
      private SlideMapper slideMapper;

      @Value("${tengxun.cos.accessKey}")
      private String accessKey;
      @Value("${tengxun.cos.secretKey}")
      private String secretKey;

//    根据id查找显示轮播图
      public SlideVO getSlideInfoBySlidId(Integer id){
            Slide slide = slideMapper.selectById(id);
            SlideVO slideVO = new SlideVO();
            BeanUtils.copyProperties(slide,slideVO);
            Integer start = slide.getArticleAddress().indexOf('=');
            slideVO.setArticleId(Integer.parseInt(slide.getArticleAddress().substring(start+1)));
            return slideVO;
      }

//    查找显示所有轮播图
      public List<Slide> getAll (){
            return slideMapper.selectAll();
      }


      public List<Slide> getFrontSlide() {
            return slideMapper.getFrontSlide();
      }
      /**
       *  添加轮播图
       */
      public Integer insertSlide(SlideVO slideVO){
            Slide slide = new Slide();
            BeanUtils.copyProperties(slideVO,slide);
            String address = "http://www.cumtcdio.cn/details.html?showId=";
            slide.setArticleAddress(address + slideVO.getArticleId());
            slideMapper.insertSlide(slide);
            return slide.getId();
      }

      public Integer updateSlideImg(Integer slideId,MultipartFile file){
            UploadMsg uploadMsg = (UploadMsg) this.postToCos(file);
            String imgPath = uploadMsg.path;
            return slideMapper.updateSlideImg(imgPath,slideId);
      }

      /**
       * 更新轮播图
       * @return
       */
      public Integer updateSlide(SlideVO slideVO){
            Slide slide = new Slide();
            BeanUtils.copyProperties(slideVO,slide);
            if (slideVO.getArticleId() != null){
                  Integer end = slideVO.getArticleAddress().indexOf('=');
                  String address = slideVO.getArticleAddress().substring(0,end+1);
                  slide.setArticleAddress(address + slideVO.getArticleId());
            }
            return slideMapper.updateSlide(slide);
      }

//     删除轮播图
      public Integer deleteSlideById(Integer id){
            return slideMapper.deleteSlideById(id);
      }

      public Object postToCos(MultipartFile file){
            String path = "https://slide-1257444045.cos.ap-shanghai.myqcloud.com";
            if (file == null) {
                  return new UploadMsg(0,"文件为空",null);
            }
            String oldFileName = file.getOriginalFilename();
            String eName = oldFileName.substring(oldFileName.indexOf("."));
            String newFileName = UUID.randomUUID() + eName;
            Calendar calendar = Calendar.getInstance();
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH);
            int date = calendar.get(Calendar.DATE);
            COSCredentials cred = new BasicCOSCredentials(accessKey,secretKey);
            ClientConfig clientConfig = new ClientConfig(new Region("ap-shanghai"));
            COSClient cosClient = new COSClient(cred, clientConfig);
            File localFile = null;
            try {
                  localFile = File.createTempFile("temp", null);
                  file.transferTo(localFile);
                  String key = "/" + "slide" + "/" + year + month + date + "/" + newFileName;
                  PutObjectRequest putObjectRequest = new PutObjectRequest("slide-1257444045",key,localFile);
                  PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
                  return new UploadMsg(1,"上传成功",path + putObjectRequest.getKey());
            }catch (IOException e){
                  return new UploadMsg(-1,e.getMessage(),null);
            }finally {
                  cosClient.shutdown();
            }
      }

      private class UploadMsg{
            public int status;
            public String msg;
            private String path;

            public UploadMsg(){
                  super();
            }

            public UploadMsg(int status,String msg,String path){
                  this.status = status;
                  this.msg = msg;
                  this.path = path;
            }
      }
}
