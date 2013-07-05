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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gzm.xm.common.entity.Product;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.enums.TypeEnum;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.ProductService;
import com.gzm.xm.service.TypeService;

@Controller
public class ProductController extends AbstractContoller{
    @Autowired
    private ProductService productService;


    @RequestMapping(value = "/toAddProduct",method = RequestMethod.GET)
    public String toAddProduct(){
        return "/product/addProduct";
    }

    @RequestMapping(value = "/addProduct",method = RequestMethod.POST)
    public String addProduct(@RequestParam String name,
                             @RequestParam Integer type,
                             @RequestParam String function,
                             @RequestParam Float price,
                             @RequestParam String include,
                             @RequestParam String volume,
                             @RequestParam String description,
                             @RequestParam(required = false) MultipartFile file,
                             MultipartHttpServletRequest request) throws IOException {
        String fileName = null;
        if (!file.isEmpty()) {
            fileName = new Date().getTime() + "."
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1,file.getOriginalFilename().length());
            String path = request.getRealPath("");
            File container = new File((path + BASE_UPLOAD_FOLDER));
            if(!container.exists()){
                container.mkdirs();
            }
            File dist = new File(container,fileName);
            FileCopyUtils.copy(file.getBytes(), dist);
        }

        productService.addProduct(name,function,price,include,volume,description,
                fileName != null ? SHOW_UPLOAD_FOLDER+fileName :null
                ,type);

       return "redirect:productList";
    }

    @RequestMapping(value = "/productList",method = {RequestMethod.POST,RequestMethod.GET})
    public String toProductList(@RequestParam(value = "pageNo",required = false) Integer pageNo,
                             @RequestParam(value = "keyWord",required = false) String key,
                             ModelMap map) {
        if(pageNo == null || pageNo == 0) {
            pageNo = 1;
        }

        long count = productService.count(key);
        PageUtil page = new PageUtil(count,pageSize,pageNo);
        map.put("page",page);

        List<Product> productList;
        productList = productService.query(pageNo, pageSize, key);
        map.put("productList",productList);
        map.put("query",appendParameter(key));
        return "/product/productList";
    }

    @RequestMapping(value = "/showProduct/{id}",method = RequestMethod.GET)
    public String showProduct(@PathVariable Integer id,
                              ModelMap map) {
        Product p = productService.showOne(id);
        map.put("product",p);
        return "product/showOne";
    }

    @RequestMapping(value = "/editProduct/{id}",method = RequestMethod.GET)
    public String toEditProduct(@PathVariable Integer id,
                                ModelMap map){
       Product p = productService.showOne(id);
       map.put("product",p);
       return "product/editProduct";
    }

    @RequestMapping(value = "/saveProduct",method = RequestMethod.POST)
    public String saveProduct(Product p,
                              Integer type,
                              @RequestParam MultipartFile file,
                              HttpServletRequest request) throws IOException{
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1,file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER),fileName);
        FileCopyUtils.copy(file.getBytes(), dist);

        productService.saveProduct(p,request.getAttribute("baseUrl")+SHOW_UPLOAD_FOLDER+fileName,type);

        return "redirect:productList";
    }

    @RequestMapping(value = "/delProduct",method = RequestMethod.POST)
    public int delProduct(@RequestParam Integer id) {
        productService.delProduct(id);
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
       return typeService
               .getSubTypeListUnderType(TypeEnum.PRODUCT_TYPE.getId());
    }
    
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.PRODUCT.getId();
    }
}
