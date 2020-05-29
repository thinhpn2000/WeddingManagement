package com.wedding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({UrlConstant.URL_LOGIN, UrlConstant.URL_LOGOUT})
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String servletPath = req.getServletPath();
		
		if(servletPath.equals(UrlConstant.URL_LOGIN)) {
			
			HttpSession userSession = req.getSession();
			if(userSession.getAttribute("LOGIN_USER") != null) {
				resp.sendRedirect(req.getContextPath() + "/dashboard");
			} 
			else {
				req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
			}
			
		}
		else
		{
			req.getSession().invalidate();
			resp.sendRedirect(req.getContextPath() + "/dashboard");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String roleUser = "";
		
		if(username.equals("admin") && password.equals("admin")) {

			HttpSession session = req.getSession();
			session.setAttribute("LOGIN_USER", username);
			session.setAttribute("USER_ROLE", "ROLE_MANAGER");
			//set cookies cho user
			
			//set session
			session.setMaxInactiveInterval(60*60);
			resp.sendRedirect(req.getContextPath() + "/dashboard");
		}
		else if(username.equals("1") && password.equals("1")) {
			HttpSession session = req.getSession();
			session.setAttribute("LOGIN_USER", username);
			session.setAttribute("USER_ROLE", "ROLE_EMPLOYEE");
			//set cookies cho user
			
			//set session
			session.setMaxInactiveInterval(60*60);
			resp.sendRedirect(req.getContextPath() + "/dashboard");
		}
		else {
			req.getRequestDispatcher(PathConstant.Path_VIEWS + "login.jsp").forward(req, resp);
		}
	}
	
	

}
