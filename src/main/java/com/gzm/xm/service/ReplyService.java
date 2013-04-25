package com.gzm.xm.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.gzm.xm.common.entity.Reply;
import com.gzm.xm.dao.ReplyDao;

@Service
public class ReplyService {
	
	Logger logger = LoggerFactory.getLogger(ReplyService.class);
	
	@Autowired
	private ReplyDao replyDao;
	
	
	public Long count(){
		return replyDao.count();
	}
	
	public Page<Reply> getAll(int pageNo, int pageSize){
		PageRequest page = new PageRequest(pageNo, pageSize, Sort.Direction.DESC, "id");
		return replyDao.findAll(page);
	}
	
	
	public void save(Reply reply){
		Date date = new Date();
		reply.setUpdatetime(date);
		replyDao.save(reply);
	}
	
	public boolean delete(Integer id){
		if(id == null || id < 1){
			logger.warn("Can not delete reply when reply id = "+ id);
			return false;
		}else{
			replyDao.delete(id);
			return true;
		}
	}
	
	public void update(Integer id , String title){
		if(id == null || id < 0 ){
			logger.warn(" Can not update reply when id is null or id < 0 !");
		}else{
			replyDao.update(title, new Date(), id);
		}
	}
	
	
	
	
}
