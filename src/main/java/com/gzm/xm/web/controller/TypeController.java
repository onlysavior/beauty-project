package com.gzm.xm.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.JsonUtils;
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
    public String getAllTypeList(@RequestParam(required = false)Integer id,  ModelMap map) {
       List<Type> typeList = typeService.getAllType(id);
       Map<Integer, String> typeEnums = TypeEnum.getAll();
       map.put("typeList", typeList);
       map.put("typeEnums", typeEnums);
       return "type/list";
    }
    
    @RequestMapping(value="type/parents", method = RequestMethod.GET ,produces="text/plain;charset=UTF-8")
    public @ResponseBody String getAllTypeEnum(){
    	return JsonUtils.toJson(TypeEnum.getAll());
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

    @RequestMapping(value = "/type/{id}",method = RequestMethod.DELETE)
    public @ResponseBody void delType(@PathVariable Integer id) {
        typeService.delType(id);
    }

    @RequestMapping(value = "/type/toAddType",method = RequestMethod.GET)
    public String toAddType() {
        return "type/addType";
    }

    @RequestMapping(value = "/type/addType",method = RequestMethod.POST)
    public String addType(Integer parentType,
                          String name) {
        typeService.addType(name, parentType);
        return "redirect:/backend/types";
    }

    @RequestMapping(value = "/admin/type/editType", method = RequestMethod.POST)
    public @ResponseBody void editType(Type type) {
        Type t = typeService.getType(type.getId());
        t.setName(type.getName());
        t.setParentType(type.getParentType());
        typeService.saveType(t);
    }
    
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.TYPE.getId();
    }
    
}
