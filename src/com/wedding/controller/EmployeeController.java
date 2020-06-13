package com.wedding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.models.Employee;
import com.wedding.service.EmployeeService;
import com.wedding.serviceImpl.EmployeeServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet(UrlConstant.URL_EMPLOYEE)
public class EmployeeController extends HttpServlet {
	
	private EmployeeService employeeService;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		employeeService = new EmployeeServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession userSession = req.getSession();
		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);
		
		List <Employee> employees = employeeService.getAllEmployee();
		req.setAttribute("employees", employees);
		
		req.getRequestDispatcher(PathConstant.Path_VIEWS_MANAGER + "employee.jsp").forward(req, resp);
	}
}
