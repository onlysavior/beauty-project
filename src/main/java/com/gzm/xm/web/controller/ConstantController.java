package com.gzm.xm.web.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.service.ConstantService;

@Controller
public class ConstantController extends AbstractContoller{
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
    public String addConstant(String title,
                              String content,
                              MultipartFile file,
                              HttpServletRequest request) throws Exception{
        String fileName = null;
        if (!file.isEmpty()) {
            fileName = new Date().getTime() + "."
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
            String path = request.getRealPath("");
            File container = new File((path + BASE_UPLOAD_FOLDER));
            if(!container.exists()){
                container.mkdirs();
            }
            File dist = new File(container,fileName);
            FileCopyUtils.copy(file.getBytes(), dist);
        }
        constantService.saveConstant(title,
                content,
                fileName != null ?request.getAttribute("baseUrl")+SHOW_UPLOAD_FOLDER+fileName:null);
        return "redirect:constantList";
    }

    @RequestMapping(value = "/delConstant",method = RequestMethod.POST)
    public String delConstant(Integer id) {
        constantService.deleteConstant(id);
        return "redirect:constantList";
    }

    @RequestMapping(value = "/constant/showOne/{id}",method = RequestMethod.GET)
    public String showConstant(@PathVariable Integer id, ModelMap map){
        Constant constant = constantService.getConstant(id);
        map.put("constant",constant);
        return "/constant/showOne";
    }
    
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.CONSTANT.getId();
    }

    @RequestMapping(value = "/saveConstant",method = RequestMethod.POST)
    public String saveConstant(@RequestParam Integer id,
                               @RequestParam(required = false) String picUrl,
                               @RequestParam(required = false) String title,
                               @RequestParam(required = false) String content,
                               @RequestParam(required = false)
                               MultipartFile file,
                               HttpServletRequest request) throws Exception{
        Constant constant = constantService.getConstant(id);
        if(file != null && !file.isEmpty()){
            String fileName = new Date().getTime() + "."
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
            String path = request.getRealPath("");
            File container = new File((path + BASE_UPLOAD_FOLDER));
            if(!container.exists()){
                container.mkdirs();
            }
            File dist = new File(container,fileName);
            FileCopyUtils.copy(file.getBytes(), dist);
            constant.setPicUrl(request.getAttribute("baseUrl")+SHOW_UPLOAD_FOLDER+fileName);
        } else {
            if (StringUtils.hasText(picUrl)) {
                constant.setPicUrl(picUrl);
            } else {
                constant.setPicUrl("");
            }
        }
        constant.setContent(content);
        constantService.editConstant(constant);
        return "redirect:constantList";
    }

    @RequestMapping(value = "/editConstant/{id}",method = RequestMethod.GET)
    public String editConstant(@PathVariable Integer id,
                               ModelMap map) {
        Constant constant = constantService.getConstant(id);
        map.put("constant",constant);
        return "/constant/editConstant";
    }
}
