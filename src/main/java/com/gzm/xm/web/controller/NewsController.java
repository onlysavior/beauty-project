package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.NewsService;
import com.gzm.xm.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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


    @RequestMapping(value = "/addNews",method = RequestMethod.POST)
    public String addNews(@RequestParam("title")String title,
                          @RequestParam("content")String content,
                          @RequestParam("type")Integer type,
                          @RequestParam(value = "file",required = false) MultipartFile file,
                          HttpServletRequest request)
            throws Exception {
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
        if (fileName != null) {
            newsService.addNews(title, content, type,
                request.getAttribute("baseUrl")+SHOW_UPLOAD_FOLDER+fileName);
        } else {
            newsService.addNews(title,content,type);
        }
        return "redirect:newsList";
    }

    @RequestMapping(value = "/newsList",method = {RequestMethod.POST,RequestMethod.GET})
    public String toNewsList(@RequestParam(value = "pageNo",required = false) Integer pageNo,
                             @RequestParam(value = "keyWord",required = false) String key,
                             @RequestParam(value = "startTime",required = false) Date startTime,
                             @RequestParam(value = "endTime",required = false) Date endTime,
                             @RequestParam(value = "type", required = false) Integer typeId,
                             ModelMap map) {
        if(pageNo == null || pageNo == 0) {
            pageNo = 1;
        }

        long count = newsService.count(key, startTime, endTime,typeId);
        PageUtil page = new PageUtil(count,pageSize,pageNo);
        map.put("page",page);

        List<News> newsList;
        newsList = newsService.query(pageNo, pageSize, key, startTime, endTime,typeId);
        map.put("newList",newsList);
        map.put("query",appendParameter(key, startTime, endTime, typeId));
        return "/news/newsList";
    }

    @RequestMapping(value = "/delNews",method = RequestMethod.POST)
    public int delNews(@RequestParam Integer id){
        newsService.delNes(id);
        return 1;
    }

    @RequestMapping(value = "/editNews/{id}",method = RequestMethod.GET)
    public String editNews(@PathVariable int id, ModelMap map) {
        News news = newsService.showOne(id);
        map.put("news",news);
        return "/news/editNews";
    }

    @RequestMapping(value = "/saveNews",method = RequestMethod.POST)
    public String saveNews(@RequestParam News news,Integer type) {
        news.setType(newsService.getType(type));
        news.setUpdatetime(new Date());

        newsService.saveNews(news);

        return "redirect:newsList";
    }

    public static String appendParameter(String key,
                                   Date startTime,
                                   Date endTime,
                                   Integer typeId) {
        StringBuilder sb = new StringBuilder();
        if (StringUtils.hasText(key)) {
            sb.append("?keyWord=");
            sb.append(key);
            sb.append("&");
        }

        if(startTime != null){
            sb.append("startTime=");
            sb.append(startTime);
            sb.append("&");
            if(endTime == null)
                endTime = new Date();
            sb.append("endTime=");
            sb.append(endTime);
            sb.append("&");
        }

        if(typeId != null && typeId != 0) {
            sb.append("typeId=");
            sb.append(typeId);
        }

        return sb.toString();
    }

    @InitBinder
    public void InitBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/fileupload",method = RequestMethod.POST)
    public String upload(@RequestParam("img")MultipartFile file,
                         MultipartHttpServletRequest request,
                         ModelMap map) throws IOException {
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File container = new File((path + BASE_UPLOAD_FOLDER));
        if(!container.exists()){
            container.mkdirs();
        }
        File dist = new File(container,fileName);
        FileCopyUtils.copy(file.getBytes(), dist);
        map.put("imageURLList",request.getAttribute("baseUrl")+SHOW_UPLOAD_FOLDER+fileName);
        return "upload/upload";
    }

    @ModelAttribute("typeList")
    public List<Type> getNewsList() {
        return typeService.getSubTypeListUnderType(TypeEnum.NEWS_TYPE.getId());
    }
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.NEWS.getId();
    }
}
