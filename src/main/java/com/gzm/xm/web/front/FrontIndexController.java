package com.gzm.xm.web.front;

import com.gzm.xm.common.entity.*;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.Crumb;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.*;
import com.gzm.xm.web.controller.AbstractContoller;
import com.gzm.xm.web.controller.NewsController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class FrontIndexController extends AbstractContoller {
    @Autowired
    private ConstantService constantService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private ProductService productService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map) {
        Constant gzm = constantService.getConstant(GZM_JIESHAO_ID);
        map.put("gzm", gzm);

        List<News> ourNews = newsService.query(1, 5, "", null, null, TypeEnum.NEWS_SUB_OUR.getId());
        map.put("newList", ourNews);
        List<News> indNews = newsService.query(1, 5, "", null, null, TypeEnum.NEW_SUB_LIND.getId());
        map.put("newList2", indNews);
        List<AbstractEntity> products = new ArrayList<AbstractEntity>();
        List<Product> product = productService.query(1,3,null);
        List<Project> project = projectService.query(1,2,null);

        products.addAll(product);
        products.addAll(project);
        map.put("productList", products);

        return "front/index";
    }

    @RequestMapping(value = "/news/showOne/{id}")
    public String showOneNews(@PathVariable Integer id,
                              ModelMap map) {
        News news = newsService.showOne(id);
        map.put("news", news);

        List<Crumb> crumbs = new ArrayList<Crumb>();
        Crumb root = new Crumb();
        root.setTitle("新闻动态");
        root.setUrl("/front/news/list");
        Crumb leaf = new Crumb();
        leaf.setUrl("#");
        leaf.setTitle(news.getTitle());

        crumbs.add(root);
        crumbs.add(leaf);

        map.put("crumbList", crumbs);

        List<Type> types = typeService.getSubTypeListUnderType(TypeEnum.NEWS_TYPE.getId());
        map.put("newsType", types);

        return "front/oneNews";
    }

    @RequestMapping(value = "/showProduct/{id}", method = RequestMethod.GET)
    public String showOneProduct(@PathVariable Integer id,
                                 ModelMap map) {

        List<Type> productTypes = typeService
                .getSubTypeListUnderType(TypeEnum.PRODUCT_TYPE.getId());
        map.put("productTypes", productTypes);
        List<Type> projectTypes = typeService
                .getSubTypeListUnderType(TypeEnum.PROJECT_TYPE.getId());
        map.put("projectList", projectTypes);

        Product p = productService.showOne(id);
        map.put("product", p);

        List<Crumb> crumbs = new ArrayList<Crumb>();
        Crumb pc = new Crumb();
        pc.setTitle(p.getName());
        pc.setUrl("#");
        crumbs.add(pc);
        map.put("crumbList", crumbs);

        return "front/oneProduct";
    }

    @RequestMapping(value = "/news/search", method = RequestMethod.POST)
    public String searchNews(@RequestParam Integer catid,
                             @RequestParam String key,
                             @RequestParam(required = false) Integer pageNo,
                             ModelMap map) {
        if (pageNo == null || pageNo <= 0) {
            pageNo = 1;
        }

        long count = newsService.count(key, null, null, catid);
        PageUtil page = new PageUtil(count, pageSize, pageNo);
        map.put("page", page);

        List<News> newsList;
        newsList = newsService.query(pageNo, pageSize, key, null, null, catid);
        map.put("newsList", newsList);
        map.put("query", NewsController.appendParameter(key, null, null, catid));

        List<Type> typeList = typeService.getSubTypeListUnderType(TypeEnum.NEWS_TYPE.getId());
        map.put("newsType",typeList);
        return "front/newsList";
    }

    @RequestMapping(value = "/news/typenews/{typeId}",method = RequestMethod.GET)
    public String typeNews(@PathVariable Integer typeId,
                           @RequestParam(required = false) Integer pageNo,
                           ModelMap map) {
        if (pageNo == null || pageNo <= 0) {
            pageNo = 1;
        }

        long count = newsService.count(null,null,null,typeId);
        PageUtil page = new PageUtil(count,pageSize,pageNo);
        map.put("page", page);
        List<News> newsList;
        newsList = newsService.query(pageNo,pageSize,null,null,null,typeId);
        map.put("newsList", newsList);
        map.put("query", NewsController.appendParameter(null, null, null, typeId));
        List<Type> typeList = typeService.getSubTypeListUnderType(TypeEnum.NEWS_TYPE.getId());
        map.put("newsType",typeList);
        return "front/newsList";
    }

    @RequestMapping(value = "/typeproduct/{id}", method = RequestMethod.GET)
    public String productList(@PathVariable Integer id,
                              @RequestParam(required = false) Integer pageNo,
                              ModelMap map) {
        if (pageNo == null || pageNo <= 0) {
            pageNo = 1;
        }
        map.put("typeId",id);
        long count = productService.count(null,id);
        PageUtil page = new PageUtil(count,pic_page_size,pageNo);
        map.put("page",page);
        List<Product> products = productService.query(pageNo,pic_page_size,null,id);
        map.put("productList",products);
        return "front/productList";
    }

    @RequestMapping(value = "/typeproject/{id}", method = RequestMethod.GET)
    public String projectList(@PathVariable Integer id,
                              @RequestParam(required = false) Integer pageNo,
                              ModelMap map) {
        if (pageNo == null || pageNo <= 0) {
            pageNo = 1;
        }
        map.put("typeId",id);
        long count = projectService.count(null,id);
        PageUtil page = new PageUtil(count,pic_page_size,pageNo);
        map.put("page",page);
        List<Project> projects = projectService.query(pageNo,pic_page_size,null,id);
        map.put("productList",projects);
        return "front/projectList";
    }

    @RequestMapping(value = "/project/showOne/{id}",method = RequestMethod.GET)
    public String showOneProject(@PathVariable Integer id,
                                 ModelMap map) {
        List<Type> productTypes = typeService
                .getSubTypeListUnderType(TypeEnum.PRODUCT_TYPE.getId());
        map.put("productTypes", productTypes);
        List<Type> projectTypes = typeService
                .getSubTypeListUnderType(TypeEnum.PROJECT_TYPE.getId());
        map.put("projectList", projectTypes);

        Project p = projectService.showOne(id);
        map.put("product", p);

        List<Crumb> crumbs = new ArrayList<Crumb>();
        Crumb pc = new Crumb();
        pc.setTitle(p.getName());
        pc.setUrl("#");
        crumbs.add(pc);
        map.put("crumbList", crumbs);
        return "front/oneProject";
    }

    @InitBinder
    public void InitBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null, new CustomDateEditor(dateFormat, true));
    }

    @ModelAttribute("productType")
    public List<Type> getProductType() {
        return typeService.getSubTypeListUnderType(TypeEnum.PRODUCT_TYPE.getId());
    }

    @ModelAttribute("projectType")
    public List<Type> getProjectType() {
        return typeService.getSubTypeListUnderType(TypeEnum.PROJECT_TYPE.getId());
    }
}
