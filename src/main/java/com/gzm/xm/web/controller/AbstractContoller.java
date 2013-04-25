package com.gzm.xm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gzm.xm.service.LoginService;
//import com.gzm.xm.service.ReplyService;


@Controller
public class AbstractContoller {
   @Autowired
   protected LoginService loginService;   
   public static final String CAPTCHA_IMAGE_FORMAT = "jpeg";


    public static final int pageSize = 1;
    public static final int pic_page_size = 3;

    protected static final String BASE_UPLOAD_FOLDER = "\\upload";
    protected static final String SHOW_UPLOAD_FOLDER = "/upload/";

    protected static final int GZM_JIESHAO_ID = 1;

}
