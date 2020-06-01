package com.wedding.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wedding.databaseconnection.MySqlConnection;
import com.wedding.models.Lobby;

public class LobbyRepository {
	public List<Lobby> getAll(){
		
		
		String query = "SELECT * FROM LOBBY";
	
		Connection connection = MySqlConnection.getInstance().getConnection();
		List<Lobby> lobbyList = new ArrayList<Lobby>();
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet res = statement.executeQuery();
			while(res.next()) {
				Lobby lobby = new Lobby();
				lobby.setLobbyID(res.getInt("lobbyID"));
				lobby.setLobbyName(res.getString("lobbyName"));
				lobby.setLobbyType(res.getString("lobbyType"));
				lobby.setMaxTable(res.getInt("maxTable"));
				lobby.setMinPrice(res.getInt("minPrice"));
				lobby.setDeleted(res.getBoolean("isDeleted"));
				lobbyList.add(lobby);
			}
			connection.close();
			return lobbyList;
		} catch(SQLException e) {
			System.out.println("ko vo dc");
			e.printStackTrace();
		}
		return null;
		
	}
}
