package com.gzm.xm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gzm.xm.service.LoginService;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.Date;
//import com.gzm.xm.service.ReplyService;


@Controller
public class AbstractContoller {
   @Autowired
   protected LoginService loginService;
   
   //@Autowired
   //protected ReplyService replyService;
   
   
   public static final String CAPTCHA_IMAGE_FORMAT = "jpeg";

   public static final int pageSize = 1;

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
        FileCopyUtils.copy(file.getBytes(), dist);
        map.put("imageURLList",SHOW_UPLOAD_FOLDER+fileName);
        return "upload/upload";
    }
}
