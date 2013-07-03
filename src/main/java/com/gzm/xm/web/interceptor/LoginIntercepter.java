package com.gzm.xm.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter  extends HandlerInterceptorAdapter {
	    @Override
	    public boolean preHandle(HttpServletRequest request,
	                             HttpServletResponse response,
	                             Object handler) throws Exception {
	    	System.out.print("我被拦截了");
	       
	    	if(request.getSession().getAttribute("uid") == null){
	    		response.sendRedirect(request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"backend/login"); 
	    		return false;
	    	}else{
	    		return true;
	    	}
	    }
}
