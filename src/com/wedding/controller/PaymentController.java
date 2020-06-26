package com.wedding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.wedding.models.Food;
import com.wedding.models.Service;
import com.wedding.models.ServicePair;
import com.wedding.models.UpdatePayment;
import com.wedding.models.WeddingPayment;
import com.wedding.service.FoodService;
import com.wedding.service.ServiceService;
import com.wedding.service.WeddingPaymentService;
import com.wedding.serviceImpl.FoodServiceImpl;
import com.wedding.serviceImpl.ServiceServiceImpl;
import com.wedding.serviceImpl.WeddingPaymentServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({ UrlConstant.URL_PAYMENT, UrlConstant.URL_PAYMENT_UPDATE, UrlConstant.URL_PAYMENT_DELETE,
		UrlConstant.URL_PAYMENT_PAY })
public class PaymentController extends HttpServlet {
	private WeddingPaymentService weddingPaymentService;
	private FoodService foodService;
	private ServiceService serviceService;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		weddingPaymentService = new WeddingPaymentServiceImpl();
		foodService = new FoodServiceImpl();
		serviceService = new ServiceServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String role = userSession.getAttribute("USER_ROLE").toString();
		req.setAttribute("userRole", role);

		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);

		String servletPath = req.getServletPath();
		int weddingID;
		switch (servletPath) {
		case UrlConstant.URL_PAYMENT:

			// get all weddings
			List<WeddingPayment> listWedding = weddingPaymentService.getAll();

			req.setAttribute("weddings", listWedding);

			req.getRequestDispatcher(PathConstant.Path_VIEWS + "payment.jsp").forward(req, resp);

			break;
		case UrlConstant.URL_PAYMENT_DELETE:
			weddingID = Integer.parseInt(req.getParameter("weddingID"));
			weddingPaymentService.delete(weddingID);
			resp.sendRedirect(req.getContextPath() + "/payment");
			break;

		default:
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String role = userSession.getAttribute("USER_ROLE").toString();
		req.setAttribute("userRole", role);

		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);
		
		int userID = Integer.parseInt(userSession.getAttribute("USER_ID").toString());
		//req.setAttribute("userID", userID);

		String servletPath = req.getServletPath();
		int weddingID = Integer.parseInt(req.getParameter("weddingID"));

		switch (servletPath) {
		case UrlConstant.URL_PAYMENT_UPDATE:
			req.setCharacterEncoding("UTF-8");

			String phone = req.getParameter("phone");
			int tableQuantity = Integer.parseInt(req.getParameter("tableQuantity"));
			int reservedTable = Integer.parseInt(req.getParameter("reservedTable"));

			// get array food [MA1, MA2, MA3]
			String[] food = req.getParameterValues("food");
			List<Integer> listFoodID = new ArrayList<Integer>();
			// convert to array foodID [1,2,3]
			for (int i = 0; i < food.length; i++) {
				int foodID = Integer.parseInt(food[i].replace("MA", ""));
				listFoodID.add(foodID);
			}

			// get list service pair
			List<ServicePair> listService = new ArrayList<ServicePair>();
			String[] service = req.getParameterValues("service");
			String[] quantity = req.getParameterValues("quantity");
			if (service != null && service.length > 0)
				// convert to array service
				for (int i = 0; i < service.length; i++) {
					// get service ID from serviceString [DV1] => 1
					int serviceID = Integer.parseInt(service[i].replace("DV", ""));
					// create service include serviceID, serviceQuantity
					ServicePair pair = new ServicePair();
					pair.setServiceID(serviceID);
					pair.setServiceQuantity(Integer.parseInt(quantity[i]));
					listService.add(pair);
				}
			
			// get list old service pair
			List<ServicePair> listOldService = new ArrayList<ServicePair>();
			service = req.getParameterValues("serviceOld");
			quantity = req.getParameterValues("quantityOld");
			if (service != null && service.length > 0)
				// convert to array service
				for (int i = 0; i < service.length; i++) {
					// get service ID from serviceString [DV1] => 1
					int serviceID = Integer.parseInt(service[i].replace("DV", ""));
					// create service include serviceID, serviceQuantity
					ServicePair pair = new ServicePair();
					pair.setServiceID(serviceID);
					pair.setServiceQuantity(Integer.parseInt(quantity[i]));
					listOldService.add(pair);
				}

			UpdatePayment updatePayment = new UpdatePayment();
			updatePayment.setWeddingID(weddingID);
			updatePayment.setPhone(phone);
			updatePayment.setReservedTable(reservedTable);
			updatePayment.setTableQuantity(tableQuantity);
			updatePayment.setListFoodID(listFoodID);
			updatePayment.setListServiceReservation(listService);
			updatePayment.setListOldServiceReservation(listOldService);
			
			// call API to update
			weddingPaymentService.update(updatePayment);
			resp.sendRedirect(req.getContextPath() + "/payment");
			break;
		case UrlConstant.URL_PAYMENT_PAY:
			weddingPaymentService.pay(weddingID, userID);
			resp.sendRedirect(req.getContextPath() + "/payment");
			break;
		case UrlConstant.URL_PAYMENT:
			String action = req.getParameter("action");
			// call API get wedding by ID
			WeddingPayment weddingPayment = weddingPaymentService.getById(weddingID);

			// bind data
			req.setAttribute("wedding", weddingPayment);

			switch (action) {
			case "view":
				req.getRequestDispatcher(PathConstant.Path_VIEWS + "viewwedding.jsp").forward(req, resp);
				break;
			case "edit":
				// remove reserved food for menu
				List<Food> foods = foodService.removeFood(weddingPayment.getListFood());
				req.setAttribute("foods", foods);

				// remove reserved service for menu
				List<Service> services = serviceService.removeService(weddingPayment.getListServicePrice());
				req.setAttribute("services", services);

				req.getRequestDispatcher(PathConstant.Path_VIEWS_EMPLOYEE + "updatewedding.jsp").forward(req, resp);
				break;
			default:
				break;
			}
		default:
			break;
		}
	}

}
