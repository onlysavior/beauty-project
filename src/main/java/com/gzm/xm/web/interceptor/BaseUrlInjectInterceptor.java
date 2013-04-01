package com.gzm.xm.web.interceptor;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseUrlInjectInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        StringBuilder sb = new StringBuilder();
        sb.append(request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getRequestURI())));
        request.setAttribute("baseUrl",sb.toString());
        return super.preHandle(request, response, handler);
    }
}
