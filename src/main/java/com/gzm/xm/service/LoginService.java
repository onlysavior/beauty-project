package com.gzm.xm.service;

import com.gzm.xm.common.entity.User;
import com.gzm.xm.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
	private UserDao userDao;

    public User exitUser(User user) {
        User found = userDao.findUserByNameAndPwd(user.getName(),user.getPwd());
        return found;
    }

    public User check(String name) {
        return userDao.findUserByName(name);
    }

    public User register(String name, String pwd) {
        User user = new User();
        user.setName(name);
        user.setPwd(pwd);
        if(exitUser(user) != null){
            return null;
        }
        userDao.save(user);
        return user;
    }

}
