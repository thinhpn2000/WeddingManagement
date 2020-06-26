package com.wedding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.service.EmployeeService;
import com.wedding.serviceImpl.EmployeeServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({UrlConstant.URL_PROFILE})
public class ProfileController extends HttpServlet{
	private EmployeeService employeeService;

	@Override
	public void init() throws ServletException {
		employeeService = new EmployeeServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String username = userSession.getAttribute("LOGIN_USER").toString();
		String userRole = userSession.getAttribute("USER_ROLE").toString();
		req.setAttribute("username", username);
		req.setAttribute("userRole", userRole);
		req.getRequestDispatcher(PathConstant.Path_VIEWS + "profile.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		int userID = Integer.parseInt(userSession.getAttribute("USER_ID").toString());
		String newPswd = req.getParameter("password");
		employeeService.changePassword(newPswd, userID);
		resp.sendRedirect(req.getContextPath() + "/profile");
	}
}
