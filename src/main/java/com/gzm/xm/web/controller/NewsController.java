package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    public String toNewsList(@RequestParam(value = "pageNo",required = false) Integer pageNo,
                             @RequestParam(value = "keyWord",required = false) String key,
                             @RequestParam(value = "startTime",required = false) Date startTime,
                             @RequestParam(value = "endTime",required = false) Date endTime,
                             ModelMap map) {
       //TODO search
        if(pageNo == null || pageNo == 0) {
            pageNo = 1;
        }

        long count = newsService.count(key, startTime, endTime);
        PageUtil page = new PageUtil(count,pageSize,pageNo);
        map.put("page",page);

        List<News> newsList;
        newsList = newsService.query(pageNo, pageSize, key, startTime, endTime);
        map.put("newList",newsList);
        map.put("query",appendParameter(key, startTime, endTime));
        return "/news/newsList";
    }

    private String appendParameter(String key,Date startTime, Date endTime) {
        StringBuilder sb = new StringBuilder();
        if (StringUtils.hasText(key)) {
            sb.append("?keyWord=");
            sb.append(key);
        }

        if(startTime != null){
            if(sb.toString().contains("?")){
               sb.append("?");
            } else{
               sb.append("&");
            }
            sb.append("startTime=");
            sb.append(startTime);

            if(endTime == null)
                endTime = new Date();
            sb.append("&");
            sb.append("endTime=");
            sb.append(endTime);
        }

        return sb.toString();
    }

    @InitBinder
    public void InitBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null, new CustomDateEditor(dateFormat, true));
    }
}
