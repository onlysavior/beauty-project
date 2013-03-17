package com.gzm.xm.common.enums;

public enum TypeEnum {
	
	PRODUCT_TYPE( 1, "产品类型" ), PROJECT_TYPE( 1, "项目类型" ), NEWS_TYPE( 2, "新闻类型" );
	
	private Integer id;
	
	private String desc;

	private TypeEnum(Integer id, String desc) {
		this.id = id;
		this.desc = desc;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
	
	
	
	

}
