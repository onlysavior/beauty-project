package com.gzm.xm.common.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Project.class)
public abstract class Project_ {

	public static volatile SingularAttribute<Project, Integer> id;
	public static volatile SingularAttribute<Project, String> picUrl;
	public static volatile SingularAttribute<Project, String> description;
	public static volatile SingularAttribute<Project, Type> type;

}

