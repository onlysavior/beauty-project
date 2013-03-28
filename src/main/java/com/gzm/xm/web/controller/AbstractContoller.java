package com.gzm.xm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gzm.xm.service.LoginService;
import com.gzm.xm.service.ReplyService;


@Controller
public class AbstractContoller {
   @Autowired
   protected LoginService loginService;
   
   @Autowired
   protected ReplyService replyService;
   
   public static final String CAPTCHA_IMAGE_FORMAT = "jpeg";

   public static final int pageSize = 1;

	
}
