package com.gzm.xm.common.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Entity
@Table( name = "certificate" )
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Certificate  extends AbstractEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8440490835248876751L;

	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	private Integer id;
	
	private String instruction;
	
	@Column( name = "pic_url" )
	private String picUrl;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	
	

}
