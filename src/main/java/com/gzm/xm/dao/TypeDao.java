package com.gzm.xm.dao;


import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.gzm.xm.common.entity.Type;

public interface TypeDao extends PagingAndSortingRepository<Type,Integer> {
	
	
	
	@Modifying
	@Query("update Type t set t.name = ?1 where t.id = ?2 ")
	public void update(String name, Integer id);

    @Query("select t from Type t where  t.parentType = ?1")
    public List<Type> getSubTypeListByType(Integer parentType);
    
    @Query("select t from Type t where  t.parentType != 0")
    public List<Type> getAllTypes();

    @Query("select t from Type t where t.parentType = ?2 and t.name = ?1")
    public Type getTypeByNameAndParent(String name, Integer id);

    @Query("select t from Type t where t.parentType = 3 and t.id != 7")
    public List<Type> getNewsType();
    
}
