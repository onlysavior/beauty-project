package com.gzm.xm.service;

import com.gzm.xm.common.entity.Constant;
import com.gzm.xm.dao.ConstantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConstantService {
    @Autowired
    private ConstantDao constantDao;

    public Constant getConstant(Integer id) {
        return constantDao.findOne(id);
    }

    public void saveConstant(String title,
                             String content,
                             String picUrl) {
        Constant constant = new Constant();
        constant.setContent(content);
        constant.setTitle(title);
        constant.setPicUrl(picUrl);
        constantDao.save(constant);
    }

    public void deleteConstant(Integer id) {
        constantDao.delete(id);
    }

    public void editConstant(Constant constant) {
        constantDao.save(constant);
    }

    public List<Constant> getConstantList() {
        return constantDao.findAll();
    }
}
