package cn.cumtcdio.server.controller;

import cn.cumtcdio.server.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class UploadController {

    @Autowired
    UploadService uploadService;

    @PostMapping("/upload")
    public String uploadImage(@RequestParam MultipartFile file){
        String uri = uploadService.upload(file);
        return uri;
    }

}
