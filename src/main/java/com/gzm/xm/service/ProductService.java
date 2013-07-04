package com.gzm.xm.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.gzm.xm.common.entity.Product;
import com.gzm.xm.common.entity.Product_;
import com.gzm.xm.dao.ProductDao;
import com.gzm.xm.dao.TypeDao;

@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private TypeDao typeDao;

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    public void addProduct(String name,
                           String function,
                           Float price,
                           String include,
                           String volume,
                           String description,
                           String picUrl,
                           Integer type) {
        Product product = new Product();
        product.setFunction(function);
        product.setInclude(include);
        product.setName(name);
        if (StringUtils.hasText(picUrl))
            product.setPicUrl(picUrl);
        product.setVolume(volume);
        product.setType(typeDao.findOne(type));

        productDao.save(product);
    }

    public void saveProduct(Product p,String picUrl,Integer type) {
        p.setPicUrl(picUrl);
        p.setType(typeDao.findOne(type));
        productDao.save(p);
    }

    public long count(String key) {

        EntityManager em = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();


        CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        Root<Product> root = count.from(Product.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Product_.name), like(key));
        }


        count.select(criteriaBuilder.count(root));

        if(title != null)
            count.where(title);
        return em.createQuery(count).getSingleResult();
    }

    public long countAll() {
        return productDao.count();
    }

    public List<Product> listAll(Integer pageNo, Integer size) {
        int firstPosistion;
        if (pageNo == 1) {
            firstPosistion = 0;
        } else {
            firstPosistion = (pageNo - 1) * size;
        }

        EntityManager em = entityManagerFactory.createEntityManager();
        Query query = em.createNativeQuery("select * from product order by id desc",Product.class);
        return query.setFirstResult(firstPosistion).setMaxResults(size).getResultList();
    }

    public long count(String key,Integer typeId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();


        CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        Root<Product> root = count.from(Product.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Product_.name), like(key));
        }
        Predicate type = null;
        if (typeId != null && typeId != 0) {
            type = criteriaBuilder.equal(root.get(Product_.type),typeDao.findOne(typeId));
        }
        Predicate where = null;
        where = title == null ? (type == null ? null : type)
                : (type == null ? where : criteriaBuilder.and(title,type));

        count.select(criteriaBuilder.count(root));

        if(where != null)
            count.where(where);
        return em.createQuery(count).getSingleResult();
    }

    public List<Product> query(int pageNo,
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
        CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root<Product> root = criteriaQuery.from(Product.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Product_.name),like(key));
        }

        if (title != null) {
            criteriaQuery.where(title)
                    .orderBy(criteriaBuilder.desc(root.get(Product_.Id)));
        }

        return em.createQuery(criteriaQuery.select(root)).setFirstResult(firstPosistion)
                .setMaxResults(size).getResultList();
    }

    public List<Product> query(int pageNo,
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
        CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root<Product> root = criteriaQuery.from(Product.class);
        Predicate title = null;
        if (StringUtils.hasText(key)) {
            title = criteriaBuilder.like(root.get(Product_.name),like(key));
        }

        Predicate type = null;
        if (typeId != null && typeId != 0) {
            type = criteriaBuilder.equal(root.get(Product_.type),typeDao.findOne(typeId));
        }
        Predicate where = null;
        where = title == null ? (type == null ? null : type)
                : (type == null ? where : criteriaBuilder.and(title,type));

        if (where != null) {
            criteriaQuery.where(where)
                    .orderBy(criteriaBuilder.desc(root.get(Product_.Id)));
        }

        return em.createQuery(criteriaQuery.select(root)).setFirstResult(firstPosistion)
                .setMaxResults(size).getResultList();
    }

    public Product showOne(Integer id){
        return productDao.findOne(id);
    }

    public void delProduct(Integer id) {
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
