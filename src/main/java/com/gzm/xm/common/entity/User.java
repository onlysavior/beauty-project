package com.gzm.xm.common.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Entity
@Table( name = "user" )
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User extends AbstractEntity  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5063213490567237107L;
	
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY)
	private Integer  id;
	
	private  String name;
	
	private String pwd;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	

}
