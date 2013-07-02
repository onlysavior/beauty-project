package com.gzm.xm.web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.service.TypeService;

@Controller
public class TypeController {
    @Autowired
    private TypeService typeService;

    public @ModelAttribute("mainTypeList")
    List<Type> insertMainTypeList() {
        return typeService.getAllMainType();
    }
    @RequestMapping(value = "/types",method = RequestMethod.GET)
    public List<Type> getAllTypeList(@RequestParam(required = false)Integer id) {
       List<Type> typeList = typeService.getAllType(id);
       return typeList;
    }
    
    
    @RequestMapping(value = "/type/getSub",method = RequestMethod.POST)
    public @ResponseBody List<Type> getSubTypeList(Integer id) {
       List<Type> typeList = typeService.getSubTypeListUnderType(id);
       return typeList;
    }

    @RequestMapping(value = "/type/getType",method = RequestMethod.POST)
    public @ResponseBody Type getType(Integer id) {
        return typeService.getType(id);
    }

    @RequestMapping(value = "/type/delType",method = RequestMethod.POST)
    public @ResponseBody int delType(Integer id) {
        typeService.delType(id);
        return 1;
    }

    @RequestMapping(value = "/type/toAddType",method = RequestMethod.GET)
    public String toAddType() {
        return "type/addType";
    }

    @RequestMapping(value = "/type/addType",method = RequestMethod.POST)
    public String addType(Integer parentType,
                          String name) {
        typeService.addType(name, parentType);
        return "redirect:/backend/type/toAddType";
    }

    @RequestMapping(value = "/type/editType",method = RequestMethod.POST)
    public String editType(Integer id,String name) {
        Type t = typeService.getType(id);
        t.setName(name);
        typeService.saveType(t);
        return "redirect:/backend/type/toAddType";
    }
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.TYPE.getId();
    }
    
    @ModelAttribute("typeEnums")
    public HashMap<Integer, String> getTypeEnums(){
    	return TypeEnum.getAll();
    }
}
