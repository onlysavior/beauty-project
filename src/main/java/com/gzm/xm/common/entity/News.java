package com.gzm.xm.common.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table( name = "news" )
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class News extends AbstractEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7319630355007715886L;
	
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String title;
	
	private String content;
	
	private Date updatetime;

    private String picUrl;
	
	@ManyToOne( optional = false, fetch = FetchType.EAGER )
	@JoinColumn( name = "type_id" )
	private Type type;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }
}
