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

import com.wedding.models.Food;
import com.wedding.models.Lobby;
import com.wedding.models.Reservation;
import com.wedding.models.Service;
import com.wedding.models.ServicePair;
import com.wedding.service.FoodService;
import com.wedding.service.LobbyService;
import com.wedding.service.ReservationService;
import com.wedding.service.ServiceService;
import com.wedding.serviceImpl.FoodServiceImpl;
import com.wedding.serviceImpl.LobbyServiceImpl;
import com.wedding.serviceImpl.ReservationServiceImpl;
import com.wedding.serviceImpl.ServiceServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet({ UrlConstant.URL_RESERVATION, UrlConstant.URL_RESERVATION_ADD, UrlConstant.URL_RESERVATION_CHECK})
public class ReservationController extends HttpServlet {
	private ReservationService reservationService;
	private FoodService foodService;
	private ServiceService serviceService;
	private LobbyService lobbyService;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		reservationService = new ReservationServiceImpl();
		foodService = new FoodServiceImpl();
		serviceService = new ServiceServiceImpl();
		lobbyService = new LobbyServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession userSession = req.getSession();

		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);

		// get jsp reservation to reserve a wedding
		req.setAttribute("foods", "");

		req.setAttribute("services", "");

		req.setAttribute("weddingDate", "");
		req.setAttribute("shift", "");
		req.setAttribute("lobbies", "");
		
		req.getRequestDispatcher(PathConstant.Path_VIEWS_EMPLOYEE + "reservation.jsp").forward(req, resp);
			
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		int userID = Integer.parseInt(userSession.getAttribute("USER_ID").toString());
		req.setCharacterEncoding("UTF-8");
		String servletPath = req.getServletPath();
		switch(servletPath) {
		case UrlConstant.URL_RESERVATION_ADD:
			String weddingDate = req.getParameter("weddingDate");
			int shift = Integer.parseInt(req.getParameter("shift"));
			int lobbyID = Integer.parseInt(req.getParameter("lobbyID").replace("S", ""));
			String groom = req.getParameter("groom");
			String bride = req.getParameter("bride");
			int deposit = Integer.parseInt(req.getParameter("deposit"));
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
			
			Reservation reservation = new Reservation();
			reservation.setWeddingDate(weddingDate);
			reservation.setShift(shift);
			reservation.setUserID(userID);
			reservation.setLobbyID(lobbyID);
			reservation.setGroom(groom);
			reservation.setBride(bride);
			reservation.setPhone(phone);
			reservation.setTableQuantity(tableQuantity);
			reservation.setReservedTable(reservedTable);
			reservation.setDeposit(deposit);
			reservation.setListFoodID(listFoodID);
			reservation.setListServiceReservation(listService);
			
			// call API to add
			reservationService.addReservation(reservation);
			resp.sendRedirect(req.getContextPath() + "/reservation");
			break;
		case UrlConstant.URL_RESERVATION_CHECK:
			weddingDate = req.getParameter("weddingDate");
			shift = Integer.parseInt(req.getParameter("shift"));
			List<Lobby> listLobby = lobbyService.checkLobby(weddingDate, shift);
			
			userSession = req.getSession();

			String username = userSession.getAttribute("LOGIN_USER").toString();
			req.setAttribute("username", username);

			// get jsp reservation to reserve a wedding
			
			// get food for menu
			List<Food> foods = foodService.getAllFood();
			req.setAttribute("foods", foods);

			// get service for menu
			List<Service> services = serviceService.getAllService();
			req.setAttribute("services", services);
			
			req.setAttribute("weddingDate", weddingDate);
			req.setAttribute("shift", shift);
			req.setAttribute("lobbies", listLobby);
			
			
			req.getRequestDispatcher(PathConstant.Path_VIEWS_EMPLOYEE + "reservation.jsp").forward(req, resp);
			break;
		default:
			break;
			
		}
			
	}
}
