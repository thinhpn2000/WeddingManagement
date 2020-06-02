package com.wedding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.models.Food;
import com.wedding.service.FoodService;
import com.wedding.serviceImpl.FoodServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet(UrlConstant.URL_FOOD)
public class FoodController extends HttpServlet {
	
	private FoodService foodService;
	
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		foodService = new FoodServiceImpl();
	}



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession userSession = req.getSession();
		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);
		
		String role = userSession.getAttribute("USER_ROLE").toString();
		req.setAttribute("userRole", role);
		
		List<Food> foods = foodService.getAllFood();
		
		req.setAttribute("foods", foods);
		
		req.getRequestDispatcher(PathConstant.Path_VIEWS + "food.jsp").forward(req, resp);		
		
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String foodName = req.getParameter("foodName");

		int foodPrice = Integer.parseInt(req.getParameter("foodPrice"));
		String foodNote = req.getParameter("foodNote");
		String startingDate = java.time.LocalDate.now().toString();
		String endingDate = null;
		Food food = new Food();
		food.setFoodName(foodName);
		food.setFoodPrice(foodPrice);
		food.setFoodNote(foodNote);
		food.setStartingDate(startingDate);
		food.setEndingDate(endingDate);
		System.out.println(foodName);
		foodService.addFood(food);
		resp.sendRedirect(req.getContextPath() + "/food");
	}
	
	
	
}
