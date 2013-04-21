package com.gzm.xm.web.front;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.service.ConstantService;
import com.gzm.xm.web.controller.AbstractContoller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontIndexController extends AbstractContoller {
    @Autowired
    private ConstantService constantService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(ModelMap map) {
        Constant gzm = constantService.getConstant(GZM_JIESHAO_ID);
        map.put("gzm",gzm);

        return "";
    }
}
