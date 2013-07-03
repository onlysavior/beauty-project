package com.gzm.xm.web.controller;

import java.util.List;

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
import com.gzm.xm.service.TypeService;

@Controller
public class TypeController {
    @Autowired
    private TypeService typeService;

    
    @RequestMapping(value = "/types",method = RequestMethod.GET)
    public String getAllTypeList(@RequestParam(required = false)Integer id,  ModelMap map) {
       List<Type> typeList = typeService.getSubTypeListUnderType(TypeEnum.PRODUCT_TYPE.getId());
       map.put("typeList", typeList);
       return "type/list";
    }
    
    

    @RequestMapping(value = "/type/{id}",method = RequestMethod.DELETE)
    public @ResponseBody void delType(@PathVariable Integer id) {
        typeService.delType(id);
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
