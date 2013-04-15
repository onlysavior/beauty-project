package com.gzm.xm.web.front;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.service.ConstantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontConstantController {
    @Autowired
    private ConstantService constantService;

    @RequestMapping(value = "/showConstant/{id}",method = RequestMethod.GET)
    public String showOne(@PathVariable Integer id,ModelMap map) {
        Constant constant = constantService.getConstant(id);
        map.put("title",constant.getTitle());
        map.put("content",constant.getContent());

        return "front/constant";
    }
}
