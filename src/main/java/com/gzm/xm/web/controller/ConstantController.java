package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.service.ConstantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;

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
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER),fileName);
        FileCopyUtils.copy(file.getBytes(), dist);
        constantService.saveConstant(title,
                content,
                request.getAttribute("baseUrl")+SHOW_UPLOAD_FOLDER+fileName);
        return "redirect:constantList";
    }

    @RequestMapping(value = "/delConstant",method = RequestMethod.POST)
    public String delConstant(Integer id) {
        constantService.deleteConstant(id);
        return "redirect:constantList";
    }

    @RequestMapping(value = "/showOne/{id}")
    public String showConstant(@PathVariable Integer id, ModelMap map){
        Constant constant = constantService.getConstant(id);
        map.put("constant",constant);
        return "/constant/showOne";
    }
    
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.CONSTANT.getId();
    }
}
