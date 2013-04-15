package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.service.ConstantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ConstantController {
    @Autowired
    private ConstantService constantService;

    @RequestMapping(value = "/toAddConstant",method = RequestMethod.GET)
    public String toAddConstant() {
        return "/constant/addConstant";
    }

    @RequestMapping(value = "/constantList",method = RequestMethod.GET)
    public String toConstantList(ModelMap map){
        List<Constant> constantList = null;
        constantList = constantService.getConstantList();
        map.put("constantList",constantList);

        return "/constant/constantlist";
    }

    @RequestMapping(value = "/addConstant",method = RequestMethod.POST)
    public String addConstant(String title,String content) {
        constantService.saveConstant(title,content);
        return "redirect:/constantList";
    }

    @RequestMapping(value = "/delConstant",method = RequestMethod.POST)
    public String delConstant(Integer id) {
        constantService.deleteConstant(id);
        return "redirect:/backend/constantList";
    }

    @RequestMapping(value = "/showOne/{id}")
    public String showConstant(@PathVariable Integer id, ModelMap map){
        Constant constant = constantService.getConstant(id);
        map.put("news",constant);
        return "/constant/showOne";
    }
}
