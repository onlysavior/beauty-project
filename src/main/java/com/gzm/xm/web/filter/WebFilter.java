package com.gzm.xm.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class WebFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		if(servletRequest instanceof HttpServletRequest){
			HttpServletRequest request = (HttpServletRequest)servletRequest;
			request.setCharacterEncoding("UTF-8");
			request.setAttribute("website", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/");
			chain.doFilter(request, servletResponse);
		}
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
