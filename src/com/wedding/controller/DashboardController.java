package com.wedding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.utils.PathConstant;
import com.wedding.utils.RoleConstant;
import com.wedding.utils.UrlConstant;

@WebServlet(UrlConstant.URL_DASHBOARD)
public class DashboardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String role = userSession.getAttribute("USER_ROLE").toString();

		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);
		switch(role) {
			case RoleConstant.ROLE_MANAGER:
				req.getRequestDispatcher(PathConstant.Path_VIEWS_MANAGER + "dashboard.jsp").forward(req, resp);
				break;
			case RoleConstant.ROLE_EMPLOYEE:
				req.getRequestDispatcher(PathConstant.Path_VIEWS_EMPLOYEE + "dashboard.jsp").forward(req, resp);
				break;
			default:
				break;
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	
	
}
