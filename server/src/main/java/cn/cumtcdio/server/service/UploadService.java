package cn.cumtcdio.server.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

    String upload(MultipartFile multipartFile);

}
