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

import com.gzm.xm.common.entity.Certificate;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.util.PageUtil;
import com.gzm.xm.service.CertificateService;

@Controller
public class CertificateController extends AbstractContoller {
    @Autowired
    private CertificateService certificateService;

    @RequestMapping(value = "/toAddCertificate", method = RequestMethod.GET)
    public String toAddProject() {
        return "/certificate/addCertificate";
    }

    @RequestMapping(value = "/addCertificate", method = RequestMethod.POST)
    public String addProject(@RequestParam String description,
                             @RequestParam MultipartFile file,
                             HttpServletRequest request) throws IOException {
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File container = new File((path + BASE_UPLOAD_FOLDER));
        if(!container.exists()){
            container.mkdirs();
        }
        File dist = new File(container,fileName);
        FileCopyUtils.copy(file.getBytes(), dist);
        //certificateService.addProduct(description, request.getAttribute("baseUrl") + SHOW_UPLOAD_FOLDER + fileName);
        certificateService.addProduct(description, SHOW_UPLOAD_FOLDER + fileName);

        return "redirect:certificateList";
    }

    @RequestMapping(value = "/certificateList", method = {RequestMethod.POST, RequestMethod.GET})
    public String toProductList(@RequestParam(value = "pageNo", required = false) Integer pageNo,
                                @RequestParam(value = "keyWord", required = false) String key,
                                ModelMap map) {
        if (pageNo == null || pageNo == 0) {
            pageNo = 1;
        }

        long count = certificateService.count(key);
        PageUtil page = new PageUtil(count, pageSize, pageNo);
        map.put("page", page);

        List<Certificate> productList;
        productList = certificateService.query(pageNo, pageSize, key);
        map.put("productList", productList);
        map.put("query", appendParameter(key));
        return "certificate/certificateList";
    }

    @RequestMapping(value = "/showCertificate/{id}", method = RequestMethod.GET)
    public String showProduct(@PathVariable Integer id,
                              ModelMap map) {
        Certificate p = certificateService.showOne(id);
        map.put("project", p);
        return "certificate/showOne";
    }

    @RequestMapping(value = "/editCertificate/{id}", method = RequestMethod.GET)
    public String toEditProduct(@PathVariable Integer id,
                                ModelMap map) {
        Certificate p = certificateService.showOne(id);
        map.put("product", p);
        return "certificate/editCertificate";
    }

    @RequestMapping(value = "/saveCertificate", method = RequestMethod.POST)
    public String saveProduct(Certificate p,
                              @RequestParam MultipartFile file,
                              HttpServletRequest request) throws IOException {
        String fileName = new Date().getTime() + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        String path = request.getRealPath("");
        File dist = new File((path + BASE_UPLOAD_FOLDER), fileName);
        FileCopyUtils.copy(file.getBytes(), dist);

        certificateService.saveProduct(p, request.getAttribute("baseUrl") + SHOW_UPLOAD_FOLDER + fileName);

        return "redirect:certificateList";
    }

    @RequestMapping(value = "/delCertificate",method = RequestMethod.POST)
    public int delCertificate(@RequestParam Integer id) {
        certificateService.delCertificate(id);
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
    
    @ModelAttribute("pageType")
    public Integer getPageType() {
        return PageEnum.CERTIFICATE.getId();
    }
}
