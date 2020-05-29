package com.wedding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet(UrlConstant.URL_RESERVATION)
public class ReservationController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(PathConstant.Path_VIEWS_EMPLOYEE + "reservation.jsp").forward(req, resp);
	}
}
