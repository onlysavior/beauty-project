package com.gzm.xm.common.enums;

public enum PageEnum {
	
	REPLY(1),CERTIFICATE(2),PRODUCT(3),PROJECT(4),TYPE(5),NEWS(6),CONSTANT(7),ABOUT(8);
	
	private Integer id;
	
	private PageEnum(Integer id){
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
}
