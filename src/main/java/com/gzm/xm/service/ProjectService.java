package com.gzm.xm.service;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.gzm.xm.common.entity.Project;
import com.gzm.xm.common.entity.Project_;
import com.gzm.xm.dao.ProjectDao;
import com.gzm.xm.dao.TypeDao;

@Service
public class ProjectService {

    @Autowired
    private ProjectDao productDao;
    @Autowired
    private TypeDao typeDao;

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    public void addProduct(
                           String description,
                           String picUrl,
                           Integer type) {
        Project project = new Project();
        project.setDescription(description);
        project.setPicUrl(picUrl);
        project.setType(typeDao.findOne(type));

        productDao.save(project);
    }

    public void saveProduct(Project p,
                            String picUrl,
                            Integer type) {
        p.setPicUrl(picUrl);
        p.setType(typeDao.findOne(type));
        productDao.save(p);
    }

    public long count(String key) {

        EntityManager em = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();


        CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        Root<Project> root = count.from(Project.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Project_.description), like(key));
        }


        count.select(criteriaBuilder.count(root));

        if(title != null)
            count.where(title);
        return em.createQuery(count).getSingleResult();
    }

    public long count(String key,Integer typeId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();


        CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        Root<Project> root = count.from(Project.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Project_.description), like(key));
        }
        Predicate type = null;
        if (typeId != null && typeId != 0) {
            type = criteriaBuilder.equal(root.get(Project_.type),typeDao.findOne(typeId));
        }
        Predicate where = null;
        where = title == null ? (type == null ? null : type)
                : (type == null ? where : criteriaBuilder.and(title,type));

        count.select(criteriaBuilder.count(root));

        if(where != null)
            count.where(where);
        return em.createQuery(count).getSingleResult();
    }

    public List<Project> query(int pageNo,
                               int size,
                               String key) {
        int firstPosistion;
        if (pageNo == 1) {
            firstPosistion = 0;
        } else {
            firstPosistion = (pageNo - 1) * size;
        }
        EntityManager em = entityManagerFactory.createEntityManager();

        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Project> criteriaQuery = criteriaBuilder.createQuery(Project.class);
        Root<Project> root = criteriaQuery.from(Project.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Project_.description),like(key));
        }

        if (title != null) {
            criteriaQuery.where(title);
        }

        return em.createQuery(criteriaQuery.select(root)).setFirstResult(firstPosistion)
                .setMaxResults(size).getResultList();
    }

    public List<Project> query(int pageNo,
                               int size,
                               String key,
                               Integer typeId) {
        int firstPosistion;
        if (pageNo == 1) {
            firstPosistion = 0;
        } else {
            firstPosistion = (pageNo - 1) * size;
        }
        EntityManager em = entityManagerFactory.createEntityManager();

        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Project> criteriaQuery = criteriaBuilder.createQuery(Project.class);
        Root<Project> root = criteriaQuery.from(Project.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Project_.description),like(key));
        }

        Predicate type = null;
        if (typeId != null && typeId != 0) {
            type = criteriaBuilder.equal(root.get(Project_.type),typeDao.findOne(typeId));
        }
        Predicate where = null;
        where = title == null ? (type == null ? null : type)
                : (type == null ? where : criteriaBuilder.and(title,type));

        if (where != null) {
            criteriaQuery.where(where)
                    .orderBy(criteriaBuilder.desc(root.get("id")));
        }

        return em.createQuery(criteriaQuery.select(root)).setFirstResult(firstPosistion)
                .setMaxResults(size).getResultList();
    }

    public Project showOne(Integer id){
        return productDao.findOne(id);
    }

    public void delProject(Integer id) {
        productDao.delete(id);
    }

    private String like(String key) {
        StringBuilder sb = new StringBuilder();
        sb.append("%");
        sb.append(key);
        sb.append("%");

        return sb.toString();
    }
}
