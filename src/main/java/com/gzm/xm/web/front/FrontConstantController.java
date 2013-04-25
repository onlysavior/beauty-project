package com.gzm.xm.web.front;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.ConstantService;
import com.gzm.xm.service.NewsService;
import com.gzm.xm.web.controller.AbstractContoller;
import com.gzm.xm.web.controller.NewsController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class FrontConstantController extends AbstractContoller{
    @Autowired
    private ConstantService constantService;
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/showConstant/{id}",method = RequestMethod.GET)
    public String showOne(@PathVariable Integer id,ModelMap map) {
        Constant constant = constantService.getConstant(id);
        map.put("title",constant.getTitle());
        map.put("content",constant.getContent());

        return "front/constant";
    }

    @RequestMapping(value = "/front/pic",method = RequestMethod.GET)
    public String showMutiPic(@RequestParam(required = false) Integer pageNo,
                              ModelMap map) {
        if(pageNo == null || pageNo <= 0)
            pageNo = 1;

        long count = newsService.count(null,null,null, TypeEnum.MUTI_PIC.getId());
        List<News> pics = newsService.query(pageNo,pic_page_size,null,null,null,
                TypeEnum.MUTI_PIC.getId());
        PageUtil page = new PageUtil(count,pic_page_size,pageNo);
        map.put("page",page);
        String query = NewsController.appendParameter(null,null,null,TypeEnum.MUTI_PIC.getId());
        map.put("query",query);
        map.put("picList",pics);

        return "front/mutipic";
    }


}
