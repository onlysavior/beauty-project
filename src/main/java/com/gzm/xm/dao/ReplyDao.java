package com.gzm.xm.dao;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.gzm.xm.common.entity.Reply;

public interface ReplyDao extends JpaRepository<Reply,Integer>,JpaSpecificationExecutor<Reply> {
	
	 @Modifying 
	 @Transactional(readOnly = false )
	 @Query("update Reply r set r.title=?1 , r.updatetime = ?2  where r.id = ?3 ") 
	 public void update(String title,  Date updateTime,Integer id); 
}
