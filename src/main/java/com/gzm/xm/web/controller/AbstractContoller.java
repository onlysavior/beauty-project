package com.gzm.xm.web.controller;

import com.gzm.xm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class AbstractContoller {
   @Autowired
   protected LoginService loginService;
   public static final String CAPTCHA_IMAGE_FORMAT = "jpeg";
   public static final int pageSize = 1;
	
}
