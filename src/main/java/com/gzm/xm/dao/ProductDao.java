package com.gzm.xm.dao;


import com.gzm.xm.common.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDao extends JpaRepository<Product,Integer>{
}
