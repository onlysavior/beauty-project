package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.StaticAutoWired;
import com.gzm.xm.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gzm.xm.service.LoginService;

import java.util.HashMap;
import java.util.Map;
//import com.gzm.xm.service.ReplyService;


@Controller
public class AbstractContoller {
   @Autowired
   protected LoginService loginService;   
   public static final String CAPTCHA_IMAGE_FORMAT = "jpeg";


    public static final int pageSize = 20;
    public static final int pic_page_size = 3;

    protected static final String BASE_UPLOAD_FOLDER = "\\upload";
    protected static final String SHOW_UPLOAD_FOLDER = "/upload/";

    protected static final int GZM_JIESHAO_ID = 1;
    protected static final int product_pagesize = 12;
    public static final String ourNewsKey = "our";
    public static final String indNewsKey = "ind";

    @Autowired
    protected TypeService typeService;

    //ugly
    public static Map<String,Integer> typeCache = new HashMap<String, Integer>();

    static {
        typeCache.put("our",1);
        typeCache.put("ind",2);
    }

}
