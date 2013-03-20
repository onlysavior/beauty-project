package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class NewsController extends AbstractContoller{
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/addNews",method = RequestMethod.GET)
    public String toNewAddPage() {
        return "/news/addNews";
    }

    @RequestMapping(value = "/news/{id}",method = RequestMethod.GET)
    public String showOne(@PathVariable Integer id, ModelMap map) {
       News news = newsService.showOne(id);
       map.put("news",news);
       return "/news/showOne";
    }

    public @ModelAttribute("typeList")
    List<Type> injectTypeList() {
       return newsService.getTypeList();
    }

    @RequestMapping(value = "/addNews",method = RequestMethod.POST)
    public String addNews(@RequestParam("title")String title,
                          @RequestParam("content")String content,
                          @RequestParam("type")Integer type) {
        newsService.addNews(title, content, type);
        //TODO
        return "/welcome";
    }

    @RequestMapping(value = "/newsList",method = {RequestMethod.POST,RequestMethod.GET})
    public String toNewsList(@RequestParam("pageNo") long pageNo,
                             ModelMap map) {
       //TODO search
        long count = newsService.count();
        PageUtil page = new PageUtil(count,pageSize,pageNo);
        map.put("page",page);

        List<News> newsList = new ArrayList<News>();
        newsList = newsService.query(pageNo, count);
        map.put("newList",newsList);

        return "/news/newsList";
    }
}
