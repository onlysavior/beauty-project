package com.gzm.xm.web.controller;


import java.io.File;
import java.io.IOException;
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

import com.gzm.xm.common.entity.Project;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.ProjectService;
import com.gzm.xm.service.TypeService;

@Controller
public class ProjectController extends AbstractContoller{
    @Autowired
    private ProjectService projectService;
    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "/toAddProject",method = RequestMethod.GET)
    public String toAddProject() {
        return "/project/addProject";
    }

    @RequestMapping(value = "/addProject",method = RequestMethod.POST)
    public String addProject(@RequestParam String description,
                             @RequestParam Integer type,
                             @RequestParam(required = false) MultipartFile file,
                             HttpServletRequest request) throws IOException {
        String fileName = null;
        if (!file.isEmpty()) {
            fileName = new Date().getTime()
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
            String path = request.getRealPath("");
            File container = new File((path + BASE_UPLOAD_FOLDER));
            if(!container.exists()){
                container.mkdirs();
            }
            File dist = new File(container,fileName);
            FileCopyUtils.copy(file.getBytes(), dist);
        }

        projectService.addProduct(description,
                (!file.isEmpty())? SHOW_UPLOAD_FOLDER + fileName : null,
                type);

        return "redirect:projectList";
    }

    @RequestMapping(value = "/projectList",method = {RequestMethod.POST,RequestMethod.GET})
    public String toProductList(@RequestParam(value = "pageNo",required = false) Integer pageNo,
                                @RequestParam(value = "keyWord",required = false) String key,
                                ModelMap map) {
        if(pageNo == null || pageNo == 0) {
            pageNo = 1;
        }

        long count = projectService.count(key);
        PageUtil page = new PageUtil(count,pageSize,pageNo);
        map.put("page",page);

        List<Project> productList;
        productList = projectService.query(pageNo, pageSize, key);
        map.put("productList",productList);
        map.put("query",appendParameter(key));
        return "project/projectList";
    }

    @RequestMapping(value = "/showProject/{id}",method = RequestMethod.GET)
    public String showProduct(@PathVariable Integer id,
                              ModelMap map) {
        Project p = projectService.showOne(id);
        map.put("project",p);
        return "project/showOne";
    }

    @RequestMapping(value = "/editProject/{id}",method = RequestMethod.GET)
    public String toEditProduct(@PathVariable Integer id,
                                ModelMap map){
        Project p = projectService.showOne(id);
        map.put("product",p);
        return "project/editProject";
    }

    @RequestMapping(value = "/saveProject",method = RequestMethod.POST)
    public String saveProduct(Project p,
                              @RequestParam Integer type,
                              @RequestParam MultipartFile file,
                              HttpServletRequest request) throws IOException{
        String fileName = new Date().getTime()
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER),fileName);
        FileCopyUtils.copy(file.getBytes(), dist);

        projectService.saveProduct(p,
                SHOW_UPLOAD_FOLDER+fileName,
                type);

        return "redirect:projectList";
    }

    @RequestMapping(value = "/delProject",method = RequestMethod.POST)
    public int delProject(@RequestParam Integer id) {
        projectService.delProject(id);
        return 1;
    }

    private String appendParameter(String key) {
        StringBuilder sb = new StringBuilder();
        if (StringUtils.hasText(key)) {
            sb.append("?keyWord=");
            sb.append(key);
        }

        return sb.toString();
    }

    @ModelAttribute("typeList")
    public List<Type> getType() {
        return typeService.getSubTypeListUnderType(TypeEnum.PROJECT_TYPE.getId());
    }
    
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.PROJECT.getId();
    }
}
