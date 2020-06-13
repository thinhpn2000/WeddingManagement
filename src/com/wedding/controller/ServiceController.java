package com.wedding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.models.Service;
import com.wedding.service.ServiceService;
import com.wedding.serviceImpl.ServiceServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({UrlConstant.URL_SERVICE, UrlConstant.URL_SERVICE_ADD, UrlConstant.URL_SERVICE_DELETE, UrlConstant.URL_SERVICE_UPDATE})
public class ServiceController extends HttpServlet {
	
	private ServiceService serviceService;
	
	

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		serviceService = new ServiceServiceImpl();
	}



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String servletPath = req.getServletPath();
		switch(servletPath) {
			case UrlConstant.URL_SERVICE:
				HttpSession userSession = req.getSession();
				String role = userSession.getAttribute("USER_ROLE").toString();
				req.setAttribute("userRole", role);

				String username = userSession.getAttribute("LOGIN_USER").toString();
				req.setAttribute("username", username);
				
				List<Service> services = serviceService.getAllService();
				
				req.setAttribute("services", services);
				
				req.getRequestDispatcher(PathConstant.Path_VIEWS + "service.jsp").forward(req, resp);
				break;
			case UrlConstant.URL_SERVICE_DELETE:
				int serviceID = Integer.parseInt(req.getParameter("serviceID"));
				serviceService.deleteService(serviceID);
				resp.sendRedirect(req.getContextPath() + "/service");
				break;	
				default:
					resp.sendRedirect(req.getContextPath() + "/service");
					break;
		}
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String serviceName = req.getParameter("serviceName");
		int servicePrice = Integer.parseInt(req.getParameter("servicePrice"));
		String startingDate = java.time.LocalDate.now().toString();
		Service service = new Service();
		service.setServiceName(serviceName);
		service.setServicePrice(servicePrice);
		service.setStartingDate(startingDate);
		String servletPath = req.getServletPath();
		switch (servletPath) {
		case UrlConstant.URL_SERVICE_ADD:
			serviceService.addService(service);
			resp.sendRedirect(req.getContextPath() + "/service");
			break;
		case UrlConstant.URL_SERVICE_UPDATE:
			int serviceID = Integer.parseInt(req.getParameter("serviceID"));
			service.setServiceID(serviceID);
			serviceService.updateService(service);
			resp.sendRedirect(req.getContextPath() + "/service");
			break;
		}
	}
	
	
}
