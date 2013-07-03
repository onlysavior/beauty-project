package com.gzm.xm.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.gzm.xm.common.entity.News;
import com.gzm.xm.common.entity.News_;
import com.gzm.xm.common.entity.Type;
import com.gzm.xm.dao.NewsDao;
import com.gzm.xm.dao.TypeDao;

@Service
public class NewsService {
    @Autowired
    private TypeDao typeDao;
    @Autowired
    private NewsDao newsDao;
    @Autowired
    private EntityManagerFactory entityManagerFactory;

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

    public void addNews(String title, String content, Integer typeId,
                        String picUrl) {
        News news = new News();
        news.setContent(content);
        news.setTitle(title);
        if (picUrl != null)
            news.setPicUrl(picUrl);
        Type type = typeDao.findOne(typeId);
        news.setType(type);
        news.setUpdatetime(new Date());

        newsDao.save(news);
    }

    public void addNews(String title, String content, Integer typeId) {
        addNews(title, content, typeId, null);
    }

    public News showOne(Integer id) {
        return newsDao.findOne(id);
    }

    public long count(String key,
                      Date startTime,
                      Date endTime,
                      Integer typeId) {

        EntityManager em = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();


        CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        Root<News> root = count.from(News.class);
        Predicate time = null;
        Predicate title = null;
        Predicate type = null;
        if(startTime != null){
            if(endTime == null)
                endTime = new Date();
            time = criteriaBuilder.between(root.get(News_.updatetime),startTime,endTime);
        }
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(News_.title),like(key));
        }
        if (typeId != null && typeId != 0) {
            type = criteriaBuilder.equal(root.get(News_.type),typeDao.findOne(typeId));
        }


        Predicate where = null;
        where = title == null ? time : time == null ? title : criteriaBuilder.and(time,title);
        where = type == null ? where : where == null ? type : criteriaBuilder.and(where,type);
        count.select(criteriaBuilder.count(root));

        if(where != null)
            count.where(where);
        return em.createQuery(count).getSingleResult();
    }

    public List<News> query(int pageNo,
                            int size,
                            String key,
                            Date startTime,
                            Date endTime,
                            Integer typeId) {
        int firstPosistion;
        if (pageNo == 1) {
            firstPosistion = 0;
        } else {
            firstPosistion = (pageNo - 1) * size;
        }
        EntityManager em = entityManagerFactory.createEntityManager();

        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<News> criteriaQuery = criteriaBuilder.createQuery(News.class);
        Root<News> root = criteriaQuery.from(News.class);
        Predicate time = null;
        Predicate title = null;
        Predicate type = null;
        if(startTime != null){
            if(endTime == null)
                endTime = new Date();
            time = criteriaBuilder.between(root.get(News_.updatetime),startTime,endTime);
        }
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(News_.title),like(key));
        }
        if (typeId != null && typeId != 0) {
            type = criteriaBuilder.equal(root.get(News_.type),typeDao.findOne(typeId));
        }

        Predicate where = null;
        where = title == null ? time : time == null ? title : criteriaBuilder.and(time,title);
        where = type == null ? where : where == null ? type : criteriaBuilder.and(where,type);

        if (where != null) {
            criteriaQuery.where(where).orderBy(criteriaBuilder.desc(root.get("updatetime")));
        }

       return em.createQuery(criteriaQuery.select(root)).setFirstResult(firstPosistion)
                .setMaxResults(size).getResultList();
    }

    public void delNes(Integer id) {
        newsDao.delete(id);
    }

    public Type getType(Integer id) {
        return typeDao.findOne(id);
    }

    public void saveNews(News news) {
        newsDao.save(news);
    }

    private String like(String key) {
        StringBuilder sb = new StringBuilder();
        sb.append("%");
        sb.append(key);
        sb.append("%");

        return sb.toString();
    }

    public static Specification<News> querySpecification(final String key,
                                                         final Date startTime,
                                                         final Date endTime) {
        return new Specification<News>() {
            @Override
            public Predicate toPredicate(Root<News> newsRoot, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate like = null;
                Predicate time = null;
                if(StringUtils.hasText(key)){
                    like = criteriaBuilder.like(newsRoot.get(News_.title),likePredicate(key));
                }

                if(startTime != null) {
                    Date end = null;
                    if(endTime == null) {
                        end = new Date();
                    } else {
                        end = endTime;
                    }
                    time = criteriaBuilder.between(newsRoot.get(News_.updatetime),startTime,end);
                }

                Predicate where = null;
                if (like != null && time != null) {
                    where = criteriaBuilder.and(time,like);
                } else if(like != null) {
                    where = like;
                } else if (time != null) {
                    where = time;
                }

                return where;
            }

            private String likePredicate(String searchTerm) {
                StringBuilder pattern = new StringBuilder();
                pattern.append(searchTerm.toLowerCase());
                pattern.append("%");
                return pattern.toString();
            }
        };
    }
}
