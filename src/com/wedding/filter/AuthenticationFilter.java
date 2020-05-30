package com.wedding.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AuthenticationFilter", urlPatterns = "/*")
public class AuthenticationFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession userSession = request.getSession();

		if (!request.getServletPath().startsWith("/login") && !request.getServletPath().startsWith("/assets")
				&& userSession.getAttribute("LOGIN_USER") == null) {
			response.sendRedirect(request.getContextPath() + "/login");

		} else {
			chain.doFilter(request, response);
			response.setCharacterEncoding("UTF-8");
		}

	}
}
