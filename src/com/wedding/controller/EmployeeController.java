package com.wedding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Url;

import com.wedding.models.Employee;
import com.wedding.service.EmployeeService;
import com.wedding.serviceImpl.EmployeeServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({ UrlConstant.URL_EMPLOYEE, UrlConstant.URL_EMPLOYEE_ADD, UrlConstant.URL_EMPLOYEE_DELETE,
		UrlConstant.URL_EMPLOYEE_UPDATE, UrlConstant.URL_EMPLOYEE_RESET })
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
		int userID = Integer.parseInt(userSession.getAttribute("USER_ID").toString());
		req.setAttribute("username", username);
		
		String servletPath = req.getServletPath();
		switch (servletPath) {
		case UrlConstant.URL_EMPLOYEE:
			List<Employee> employees = employeeService.getAllEmployee(userID);
			req.setAttribute("employees", employees);
			req.getRequestDispatcher(PathConstant.Path_VIEWS_MANAGER + "employee.jsp").forward(req, resp);
			break;
		case UrlConstant.URL_EMPLOYEE_DELETE:
			userID = Integer.parseInt(req.getParameter("userID"));
			employeeService.delete(userID);
			resp.sendRedirect(req.getContextPath() + "/employee");
			break;
		case UrlConstant.URL_EMPLOYEE_RESET:
			userID = Integer.parseInt(req.getParameter("userID"));
			employeeService.reset(userID);
			resp.sendRedirect(req.getContextPath() + "/employee");
			break;
		default:
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String servletPath = req.getServletPath();

		HttpSession userSession = req.getSession();
		String usernameUser = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", usernameUser);

		Employee employee = new Employee();
		String fullname = req.getParameter("fullname");
		String username = req.getParameter("username");
		int salary = Integer.parseInt(req.getParameter("salary"));

		employee.setFullname(fullname);
		employee.setUsername(username);
		employee.setSalary(salary);

		switch (servletPath) {
		case UrlConstant.URL_EMPLOYEE_ADD:
			String DOB = req.getParameter("DOB");
			String joiningDate = req.getParameter("joiningDate");
			String gender = req.getParameter("gender");

			employee.setDOB(DOB);
			employee.setJoiningDate(joiningDate);
			employee.setGender(gender);

			employeeService.add(employee);
			resp.sendRedirect(req.getContextPath() + "/employee");
			break;
		case UrlConstant.URL_EMPLOYEE_UPDATE:
			int userID = Integer.parseInt(req.getParameter("userID"));

			employee.setUserID(userID);

			employeeService.update(employee);
			resp.sendRedirect(req.getContextPath() + "/employee");
			break;
		default:
			break;
		}
	}
}
