package com.gzm.xm.service;

import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.dao.NewsDao;
import com.gzm.xm.dao.TypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class NewsService {
    @Autowired
    private TypeDao typeDao;
    @Autowired
    private NewsDao newsDao;

    public List<Type> getTypeList() {
        List<Type> typeList = new ArrayList<Type>();
        Iterable<Type> iterable = typeDao.findAll();
        if (iterable != null) {
            for (Type anIterable : iterable) {
                typeList.add(anIterable);
            }
        }
        return typeList;
    }

    public void addNews(String title, String content, Integer typeId) {
        News news = new News();
        news.setContent(content);
        news.setTitle(title);

        Type type = typeDao.findOne(typeId);
        news.setType(type);
        news.setUpdatetime(new Date());

        newsDao.save(news);
    }

    public News showOne(Integer id) {
        return newsDao.findOne(id);
    }

    public long count() {
        //TODO search
        return newsDao.count();
    }

    public List<News> query(long pageNo,long size) {
        //TODO search
        //Pageable pageable = new PageRequest(pageNo,size);
        List<News> newsList = new ArrayList<News>();
        Iterable<News> iterable = newsDao.findAll();
        if (iterable != null) {
            for (News news : iterable) {
                newsList.add(news);
            }
        }
        return newsList;
    }
}
