package com.gzm.xm.common.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Entity
@Table( name = "project" )
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Project extends AbstractEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6517295099588735635L;
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String description;
	
	@Column( name="pic_url" )
	private String picUrl;
	
	@ManyToOne( optional = false, fetch = FetchType.EAGER )
	@JoinColumn(name = "type_id") 
	private Type type;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	

}
