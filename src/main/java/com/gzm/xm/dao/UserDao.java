package com.gzm.xm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.gzm.xm.common.entity.User;


public interface UserDao extends JpaRepository<User,Integer>,JpaSpecificationExecutor<User> {
    public User findUserByNameAndPwd(String name, String pwd);
    public User findUserByName(String name);
}
