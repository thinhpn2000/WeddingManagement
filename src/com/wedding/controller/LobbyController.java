package com.wedding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wedding.models.Lobby;
import com.wedding.service.LobbyService;
import com.wedding.serviceImpl.LobbyServiceImpl;
import com.wedding.utils.PathConstant;
import com.wedding.utils.UrlConstant;

@WebServlet(UrlConstant.URL_LOBBY)
public class LobbyController extends HttpServlet {

	private LobbyService lobbyService;
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		lobbyService = new LobbyServiceImpl();
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession userSession = req.getSession();
		String role = userSession.getAttribute("USER_ROLE").toString();
		req.setAttribute("userRole", role);
		
		String username = userSession.getAttribute("LOGIN_USER").toString();
		req.setAttribute("username", username);
		
		
		List<Lobby> lobbies = lobbyService.getAllLobby();
		req.setAttribute("lobbies", lobbies);
		
		
		req.getRequestDispatcher(PathConstant.Path_VIEWS + "lobby.jsp").forward(req, resp);	
	}
}
