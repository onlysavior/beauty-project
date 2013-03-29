package com.gzm.xm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    @RequestMapping(value = "/toAddProduct",method = RequestMethod.GET)
    public String toAddProduct(){
        return "/product/addProduct";
    }
}
