package com.gzm.xm.common.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Reply.class)
public abstract class Reply_ {

	public static volatile SingularAttribute<Reply, Integer> id;
	public static volatile SingularAttribute<Reply, String> title;
	public static volatile SingularAttribute<Reply, Integer> flag;
	public static volatile SingularAttribute<Reply, Date> updatetime;

}

