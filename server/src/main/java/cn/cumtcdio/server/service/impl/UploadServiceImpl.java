package cn.cumtcdio.server.service.impl;

import cn.cumtcdio.server.service.UploadService;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.COSObject;
import com.qcloud.cos.model.GetObjectRequest;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.region.Region;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class UploadServiceImpl implements UploadService {

    @Value("${tengxun.cos.accessKey}")
    private String accessKey;
    @Value("${tengxun.cos.secretKey}")
    private String secretKey;

    @Override
    public String upload(MultipartFile multipartFile) {

        COSCredentials cred = new BasicCOSCredentials(accessKey, secretKey);
        ClientConfig clientConfig = new ClientConfig(new Region("ap-shanghai"));
        COSClient cosClient = new COSClient(cred, clientConfig);
        String bucketName = "slide-1257444045";
        // 获取文件名
        String fileName = multipartFile.getOriginalFilename();
        // 获取文件后缀
        String prefix=fileName.substring(fileName.lastIndexOf("."));
        // 用uuid作为文件名，防止生成的临时文件重复
        File file = null;
        try {
            file = File.createTempFile(UUID.randomUUID().toString(), prefix);
            // MultipartFile to File
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String key =UUID.randomUUID().toString()+ prefix;
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, file);
        cosClient.putObject(putObjectRequest);
        cosClient.shutdown();
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucketName, key);
        COSObject object = cosClient.getObject(getObjectRequest);
        String uri = object.getObjectContent().getHttpRequest().getURI().toString();
        return uri;
    }

}
