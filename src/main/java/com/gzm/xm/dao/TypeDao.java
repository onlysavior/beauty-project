package com.gzm.xm.dao;


import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.gzm.xm.common.entity.Type;

public interface TypeDao extends PagingAndSortingRepository<Type,Integer> {
	
	@Query("select t from Type t where type = ?1")
	public List<Type> getTypeByType(Integer type);
	
	@Modifying
	@Query("update Type t set t.name = ?1 where t.id = ?2 ")
	public void update(String name, Integer id);

    @Query("select t from Type t where  parentType = ?1")
    public List<Type> getSubTypeListByType(Integer parentType);

    @Query("select max(t.type)+1 from Type t")
    public Integer getMaxTypeId();

    @Query("select t from Type t where t.parentType = 0")
    public List<Type> getAllMainType();
}
