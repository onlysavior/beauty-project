package com.gzm.xm.common.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table( name = "reply" )
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Reply  extends AbstractEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 401710009971126925L;

	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	private Integer id;
	
	private String title;
	
	private Integer flag;//用来标识是否是管理员发的
	
	private Date updatetime;
	


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	
	
	
}
