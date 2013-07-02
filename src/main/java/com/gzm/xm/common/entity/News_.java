package com.gzm.xm.common.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(News.class)
public abstract class News_ {

	public static volatile SingularAttribute<News, String> content;
	public static volatile SingularAttribute<News, Integer> id;
	public static volatile SingularAttribute<News, String> title;
	public static volatile SingularAttribute<News, Date> updatetime;
	public static volatile SingularAttribute<News, Type> type;

}

