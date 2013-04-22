package com.gzm.xm.web.front;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.entity.Product;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.Crumb;
import com.gzm.xm.service.ConstantService;
import com.gzm.xm.service.NewsService;
import com.gzm.xm.service.ProductService;
import com.gzm.xm.service.TypeService;
import com.gzm.xm.web.controller.AbstractContoller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
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

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(ModelMap map) {
        Constant gzm = constantService.getConstant(GZM_JIESHAO_ID);
        map.put("gzm",gzm);

        List<News> ourNews = newsService.query(1,5,"",null,null, TypeEnum.NEWS_SUB_OUR.getId());
        map.put("newList",ourNews);
        List<News> indNews = newsService.query(1,5,"",null,null, TypeEnum.NEW_SUB_LIND.getId());
        map.put("newList2",indNews);
        List<Product> products = productService.query(1,5,"");
        map.put("productList",products);

        return "front/index";
    }

    @RequestMapping(value = "/news/showOne/{id}")
    public String showOneNews(@PathVariable Integer id,
                              ModelMap map) {
        News news = newsService.showOne(id);
        map.put("news",news);

        List<Crumb> crumbs = new ArrayList<Crumb>();
        Crumb root = new Crumb();
        root.setTitle("新闻动态");
        root.setUrl("/front/news/list");
        Crumb leaf = new Crumb();
        leaf.setUrl("#");
        leaf.setTitle(news.getTitle());

        crumbs.add(root);
        crumbs.add(leaf);

        map.put("crumbList",crumbs);

        List<Type> types = typeService.getSubTypeListUnderType(2);
        map.put("newsTypes",types);

        return "front/oneNews";
    }

    @RequestMapping(value = "/showProduct/{id}",method = RequestMethod.GET)
    public String showOneProduct(@PathVariable Integer id,
                                 ModelMap map) {

        List<Type> productTypes = typeService
                .getSubTypeListUnderType(TypeEnum.PRODUCT_TYPE.getId());
        map.put("productTypes",productTypes);
        List<Type> projectTypes = typeService
                .getSubTypeListUnderType(TypeEnum.PROJECT_TYPE.getId());
        map.put("projectList",projectTypes);

        Product p = productService.showOne(id);
        map.put("product",p);

        List<Crumb> crumbs = new ArrayList<Crumb>();
        Crumb pc = new Crumb();
        pc.setTitle(p.getName());
        pc.setUrl("#");
        crumbs.add(pc);
        map.put("crumbList",crumbs);

        return "front/oneProduct";
    }
}
