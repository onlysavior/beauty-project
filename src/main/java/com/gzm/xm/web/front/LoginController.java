package com.gzm.xm.web.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gzm.xm.common.entity.User;
import com.gzm.xm.web.controller.AbstractContoller;

@Controller
public class LoginController extends AbstractContoller {

    
	@RequestMapping(value = "/login",method =RequestMethod.GET)
	public String toLogin(HttpServletRequest request,
                          @RequestParam( required = false )Boolean error, ModelMap map ){
		if(error != null && error) {
            map.put("error","error");
        }
		
		return "login/login";
	}
	
	
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String login(User user, HttpServletRequest request, ModelMap map){
        User found = loginService.exitUser(user);
        if(found == null) {
            map.put("error","not exit user");
            return "redirect:backend/login";
        } else{
        	request.getSession().setAttribute("uid", found.getId());
        	return "redirect:backend/back/index";
        }
	}


    

}
