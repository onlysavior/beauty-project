package com.gzm.xm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NewsController {
    @RequestMapping(value = "/addNews",method = RequestMethod.GET)
    public String toNewAddPage() {
        return "/news/addNews";
    }

    @RequestMapping(value = "/news/{id}",method = RequestMethod.GET)
    public String showOne(@PathVariable Integer id) {
       return "/news/showOne";
    }
}
