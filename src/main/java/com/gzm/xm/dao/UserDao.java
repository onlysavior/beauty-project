package com.gzm.xm.dao;

import com.gzm.xm.common.entity.User;
import org.springframework.data.repository.PagingAndSortingRepository;


public interface UserDao extends PagingAndSortingRepository<User,Integer> {
    public User findUserByNameAndPwd(String name, String pwd);
    public User findUserByName(String name);
}
