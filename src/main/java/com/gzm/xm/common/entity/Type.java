package com.gzm.xm.common.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Entity
@Table( name="t_type" )
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Type extends AbstractEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5507374748791426484L;
	
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;

    private Integer parentType;

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

    public Integer getParentType() {
        return parentType;
    }

    public void setParentType(Integer parentType) {
        this.parentType = parentType;
    }
}
