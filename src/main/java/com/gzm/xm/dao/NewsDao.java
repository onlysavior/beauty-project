package com.gzm.xm.dao;


import com.gzm.xm.common.entity.News;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface NewsDao extends PagingAndSortingRepository<News,Integer> {
    @Query("select count(n.id) from News n where n.type.id != 7")
    public long countAll();
}
