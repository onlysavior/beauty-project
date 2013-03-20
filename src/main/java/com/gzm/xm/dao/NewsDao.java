package com.gzm.xm.dao;


import com.gzm.xm.common.entity.News;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface NewsDao extends PagingAndSortingRepository<News,Integer> {
}
