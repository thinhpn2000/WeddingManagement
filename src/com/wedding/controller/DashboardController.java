package com.wedding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.dto.MonthRevenueDTO;
import com.wedding.service.ReservationService;
import com.wedding.serviceImpl.ReservationServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.RoleConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({ UrlConstant.URL_DASHBOARD, UrlConstant.URL_TOTAL_REVENUE, UrlConstant.URL_MONTH_REVENUE })
public class DashboardController extends HttpServlet {
	private ReservationService reservationService;

	@Override
	public void init() throws ServletException {
		reservationService = new ReservationServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String role = userSession.getAttribute("USER_ROLE").toString();

		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);

		String servletPath = req.getServletPath();

		switch (servletPath) {

		case UrlConstant.URL_DASHBOARD:
			switch (role) {
			case RoleConstant.ROLE_MANAGER:

				String listRevenue = reservationService.getTotalRevenue(2020);
				req.setAttribute("listRevenue", listRevenue);
				req.setAttribute("year", 2020);
				req.getRequestDispatcher(PathConstant.Path_VIEWS_MANAGER + "dashboard.jsp").forward(req, resp);
				break;
			case RoleConstant.ROLE_EMPLOYEE:
				req.getRequestDispatcher(PathConstant.Path_VIEWS_EMPLOYEE + "dashboard.jsp").forward(req, resp);
				break;
			default:
				break;
			}
			break;
		default:
			break;

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String role = userSession.getAttribute("USER_ROLE").toString();

		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);

		String servletPath = req.getServletPath();

		switch (servletPath) {
		case UrlConstant.URL_TOTAL_REVENUE:

			int year = Integer.parseInt(req.getParameter("yearRevenue"));
			String listRevenue = reservationService.getTotalRevenue(year);
			req.setAttribute("listRevenue", listRevenue);
			req.setAttribute("year", year);

			req.getRequestDispatcher(PathConstant.Path_VIEWS_MANAGER + "dashboard.jsp").forward(req, resp);
			break;
		case UrlConstant.URL_MONTH_REVENUE:

			year = Integer.parseInt(req.getParameter("year"));
			int month = Integer.parseInt(req.getParameter("month"));
			listRevenue = reservationService.getTotalRevenue(year);
			List<MonthRevenueDTO> revenue = reservationService.getMonthRevenue(year, month);
			req.setAttribute("listRevenue", listRevenue);
			req.setAttribute("signal", 1);
			req.setAttribute("revenue", revenue);
			req.setAttribute("year", year);
			req.setAttribute("month", month);
			req.getRequestDispatcher(PathConstant.Path_VIEWS_MANAGER + "dashboard.jsp").forward(req, resp);
			break;
		}
	}
}
