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

import com.gzm.xm.common.entity.Certificate;
import com.gzm.xm.common.entity.Certificate_;
import com.gzm.xm.dao.CertificateDao;
import com.gzm.xm.dao.TypeDao;

@Service
public class CertificateService {
    @Autowired
    private CertificateDao certificateDao;

    @Autowired
    private TypeDao typeDao;

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    public void addProduct(
            String instruction,
            String picUrl) {
        Certificate project = new Certificate();
        project.setInstruction(instruction);
        project.setPicUrl(picUrl);

        certificateDao.save(project);
    }

    public void saveProduct(Certificate p,String picUrl) {
        p.setPicUrl(picUrl);
        certificateDao.save(p);
    }

    public long count(String key) {

        EntityManager em = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();


        CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        Root<Certificate> root = count.from(Certificate.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Certificate_.instruction), like(key));
        }


        count.select(criteriaBuilder.count(root));

        if(title != null)
            count.where(title);
        return em.createQuery(count).getSingleResult();
    }

    public List<Certificate> query(int pageNo,
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
        CriteriaQuery<Certificate> criteriaQuery = criteriaBuilder.createQuery(Certificate.class);
        Root<Certificate> root = criteriaQuery.from(Certificate.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Certificate_.instruction),like(key));
        }

        if (title != null) {
            criteriaQuery.where(title);
        }

        return em.createQuery(criteriaQuery.select(root)).setFirstResult(firstPosistion)
                .setMaxResults(size).getResultList();
    }

    public Certificate showOne(Integer id){
        return certificateDao.findOne(id);
    }

    public void delCertificate(Integer id) {
        certificateDao.delete(id);
    }

    private String like(String key) {
        StringBuilder sb = new StringBuilder();
        sb.append("%");
        sb.append(key);
        sb.append("%");

        return sb.toString();
    }
}
