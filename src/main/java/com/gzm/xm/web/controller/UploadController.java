package com.gzm.xm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
public class UploadController {
    private static final String BASE_UPLOAD_FOLDER = "\\upload";
    private static final String SHOW_UPLOAD_FOLDER = "/upload/";

    @RequestMapping(value = "/fileupload",method = RequestMethod.POST)
    public String upload(@RequestParam("img")MultipartFile file,
                         MultipartHttpServletRequest request,
                         ModelMap map) throws IOException {
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER),fileName);
        FileCopyUtils.copy(file.getBytes(),dist);
        map.put("imageURLList",SHOW_UPLOAD_FOLDER+fileName);
        return "upload/upload";
    }
}
