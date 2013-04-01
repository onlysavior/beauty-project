package com.gzm.xm.web.controller;

import com.gzm.xm.common.entity.Product;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
                             @RequestParam String function,
                             @RequestParam Float price,
                             @RequestParam String include,
                             @RequestParam String volume,
                             @RequestParam String description,
                             @RequestParam MultipartFile file,
                             MultipartHttpServletRequest request) throws IOException {
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1,file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER),fileName);
        FileCopyUtils.copy(file.getBytes(), dist);

        productService.addProduct(name,function,price,include,volume,description,
                SHOW_UPLOAD_FOLDER+fileName);

       return "redirect:/productList";
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
                              @RequestParam MultipartFile file,
                              HttpServletRequest request) throws IOException{
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1,file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER),fileName);
        FileCopyUtils.copy(file.getBytes(), dist);

        productService.saveProduct(p,SHOW_UPLOAD_FOLDER+fileName);

        return "redirect:/productList";
    }

    private String appendParameter(String key) {
        StringBuilder sb = new StringBuilder();
        if (StringUtils.hasText(key)) {
            sb.append("?keyWord=");
            sb.append(key);
        }

        return sb.toString();
    }
}
