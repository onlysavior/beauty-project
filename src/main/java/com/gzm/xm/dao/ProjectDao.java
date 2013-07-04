package com.gzm.xm.dao;


import com.gzm.xm.common.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProjectDao extends JpaRepository<Project,Integer>{

}
