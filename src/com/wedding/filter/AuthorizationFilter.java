package com.wedding.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = "/*")
public class AuthorizationFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// get session to check authorization of user
		HttpSession session = req.getSession();
		String userRole = "";
		String servletPath = req.getServletPath();
		if(session.getAttribute("USER_ROLE") != null) {
			userRole = session.getAttribute("USER_ROLE").toString();
		};
		// role manager 
		if(servletPath.startsWith("/employee")) {
			if(userRole.equalsIgnoreCase("ROLE_MANAGER")) {
				chain.doFilter(req, res);
			}
			else
				res.sendRedirect(req.getContextPath() + "/dashboard");
		}
		else if(servletPath.startsWith("/reservation")) {
			// role employee
			if(userRole.equalsIgnoreCase("ROLE_EMPLOYEE")) {
				chain.doFilter(req, res);
			}
			else
				res.sendRedirect(req.getContextPath() + "/dashboard");
		}
		else {
			chain.doFilter(req, res);
		}
	}
	
	

}
