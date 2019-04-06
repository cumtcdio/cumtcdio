package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.VO.ShowInfoVO;
import cn.cumtcdio.server.mapper.ShowMapper;
import cn.cumtcdio.server.model.Show;
import cn.cumtcdio.server.service.ShowService;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.COSObject;
import com.qcloud.cos.model.GetObjectRequest;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.region.Region;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
        return transformShowToShowInfoVO(showList);
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

    @Override
    public Integer countOneTypeShowList(Integer type) {
        return showMapper.countOneTypeShowList(type);
    }

    @Override
    public List<ShowInfoVO> getShowListLazied(Integer type, Integer offset) {
        List<Show> showList = showMapper.getShowListLazied(type, offset);
        return transformShowToShowInfoVO(showList);
    }

    @Override
    public Integer insertSelective(Show show) throws IOException {
        if (show.getHtmlContent() != null && !show.getHtmlContent().equals("") ){
            File fileTemp = new File(UUID.randomUUID().toString()+".html");
            try{
                if (!fileTemp.exists()){
                    //创建临时文件并写入内容
                    fileTemp.createNewFile();
                    fileTemp.setWritable(true);
                    PrintStream ps = new PrintStream(fileTemp);
                    ps.println("<html>");
                    ps.println("<head>");
                    ps.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
                    ps.println("</head>");
                    ps.println("<body>");
                    ps.println(show.getHtmlContent());
                    ps.println("<script type=\"text/javascript\">\n" +
                            "window.onload = function () {\n" +
                            "var h = document.body.scrollHeight;\n" +
                            "parent.postMessage(h, \"http://localhost:8080\");\n" +
                            "}<\\/script>");
                    ps.println("</body>");
                    ps.println("</html>");
                    ps.close();
                    //写入对象存储
                    COSCredentials cred = new BasicCOSCredentials("AKIDRfYFhF5iZ4F9rKzSdXBXeT1LQGp7RsLD", "DLCm5aolRqTqwkHYXFgspUs0sTmobDYb");
                    ClientConfig clientConfig = new ClientConfig(new Region("ap-shanghai"));
                    COSClient cosClient = new COSClient(cred, clientConfig);
                    String bucketName = "show-1257444045";
                    String key =UUID.randomUUID().toString()+ ".html";
                    PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, fileTemp);
                    cosClient.putObject(putObjectRequest);
                    cosClient.shutdown();
                    GetObjectRequest getObjectRequest = new GetObjectRequest(bucketName, key);
                    COSObject object = cosClient.getObject(getObjectRequest);
                    String uri = object.getObjectContent().getHttpRequest().getURI().toString();
                    show.setHtmlAddress(uri);
                    fileTemp.delete();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        show.setDateTime(new Date());
        return showMapper.insertShow(show);
    }

    @Override
    public Integer deleteByShowId(Integer id) {
        return showMapper.deleteByShowId(id);
    }

    @Override
    public List<ShowInfoVO> getShowListByShowTitleAndType(String title, Integer type) {
        List<Show> showList = showMapper.getShowListByShowTitleAndType(title, type);
        return transformShowToShowInfoVO(showList);
    }

    private List<ShowInfoVO> transformShowToShowInfoVO(List<Show> showList) {
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

    public String dateFormat(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateTime = format.format(date);
        return dateTime;
    }
}
