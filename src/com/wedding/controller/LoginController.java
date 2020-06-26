package com.wedding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.wedding.dto.UserDTO;
import com.wedding.service.AuthenAccountService;
import com.wedding.service.EmployeeService;
import com.wedding.service.RecoverPasswordService;
import com.wedding.serviceImpl.AuthenAccountServiceImpl;
import com.wedding.serviceImpl.EmployeeServiceImpl;
import com.wedding.serviceImpl.RecoverPasswordServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({ UrlConstant.URL_LOGIN, UrlConstant.URL_LOGOUT, UrlConstant.URL_LOGIN_RECOVER })
public class LoginController extends HttpServlet {
	EmployeeService employeeService;
	RecoverPasswordService recoverPasswordService;
	private AuthenAccountService authenAccountService;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		employeeService = new EmployeeServiceImpl();
		recoverPasswordService = new RecoverPasswordServiceImpl();
		authenAccountService = new AuthenAccountServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String servletPath = req.getServletPath();

		if (servletPath.equals(UrlConstant.URL_LOGIN)) {

			HttpSession userSession = req.getSession();
			if (userSession.getAttribute("LOGIN_USER") != null) {
				resp.sendRedirect(req.getContextPath() + "/dashboard");
			} else {
				req.setAttribute("alert", "");
				req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
			}

		} else {
			req.getSession().invalidate();
			resp.sendRedirect(req.getContextPath() + "/dashboard");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String servletPath = req.getServletPath();
		switch (servletPath) {
		case UrlConstant.URL_LOGIN:
			String username = req.getParameter("username");
			String password = req.getParameter("password");

			UserDTO user = authenAccountService.authenAccountLogin(username, password);
			if (user == null) {
				req.setAttribute("alert", "");
				req.getRequestDispatcher(PathConstant.Path_VIEWS + "login.jsp").forward(req, resp);
			} else if (user != null && BCrypt.checkpw("ROLE_MANAGER", user.getAccess())) {
				HttpSession session = req.getSession();

				session.setAttribute("LOGIN_USER", user.getFullname());
				session.setAttribute("USER_ROLE", "ROLE_MANAGER");
				session.setAttribute("USER_ID", user.getUserID());
				// set cookies cho user

				// set session
				session.setMaxInactiveInterval(60 * 60);
				resp.sendRedirect(req.getContextPath() + "/dashboard");
			} else if (user != null && BCrypt.checkpw("ROLE_EMPLOYEE", user.getAccess())) {
				HttpSession session = req.getSession();
				session.setAttribute("LOGIN_USER", user.getFullname());
				session.setAttribute("USER_ROLE", "ROLE_EMPLOYEE");
				session.setAttribute("USER_ID", user.getUserID());
				// set cookies cho user

				// set session
				session.setMaxInactiveInterval(60 * 60);
				resp.sendRedirect(req.getContextPath() + "/dashboard");
			}

			break;
		case UrlConstant.URL_LOGIN_RECOVER:
			username = req.getParameter("username");
			boolean isValidUsername = employeeService.checkUsername(username);
			if (isValidUsername) {
				System.out.println("Valid");
				recoverPasswordService.sendEmail(username);
				resp.sendRedirect(req.getContextPath() + "/login");
			} else {
				System.out.println("Invalid");
				String alert = "Invalid username.";
				req.setAttribute("alert", alert);
				req.getRequestDispatcher(PathConstant.Path_VIEWS + "login.jsp").forward(req, resp);
			}
			break;
		default:
			break;

		}

	}

}
