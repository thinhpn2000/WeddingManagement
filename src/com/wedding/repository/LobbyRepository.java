package com.wedding.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wedding.databaseconnection.DBConnection;
import com.wedding.databaseconnection.MySqlConnection;
import com.wedding.databaseconnection.SqlServerConnection;
import com.wedding.models.Lobby;
import com.wedding.utils.UrlConstant;

public class LobbyRepository {
	public List<Lobby> getAll() {

		String query = "";
		
		Connection connection = DBConnection.getInstance().getConnection(UrlConstant.select_DB);
		switch (UrlConstant.select_DB) {
		case 1:
			query = "SELECT lobbyID, lobbyName, lobbyTypeName, maxTable, LOBBY.isDeleted, minPrice, lobbyTypeID FROM TYPE_LOBBY, LOBBY WHERE LOBBY.lobbyType = TYPE_LOBBY.lobbyTypeID AND LOBBY.isDeleted = false ORDER BY lobbyID ASC;";
			break;
		case 2:
			query = "SELECT lobbyID, lobbyName, lobbyTypeName, maxTable, LOBBY.isDeleted, minPrice, lobbyTypeID FROM TYPE_LOBBY, LOBBY WHERE LOBBY.lobbyType = TYPE_LOBBY.lobbyTypeID AND LOBBY.isDeleted = false ORDER BY lobbyID ASC;";
			break;
		case 3:
			query = "SELECT lobbyID, lobbyName, lobbyTypeName, maxTable, LOBBY.isDeleted, minPrice, lobbyTypeID FROM TYPE_LOBBY, LOBBY WHERE LOBBY.lobbyType = TYPE_LOBBY.lobbyTypeID AND LOBBY.isDeleted = 0 ORDER BY lobbyID ASC;";
			break;
		}
		List<Lobby> lobbyList = new ArrayList<Lobby>();
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet res = statement.executeQuery();
			while (res.next()) {
				Lobby lobby = new Lobby();
				lobby.setLobbyID(res.getInt("lobbyID"));
				lobby.setLobbyName(res.getString("lobbyName"));
				lobby.setLobbyType(res.getString("lobbyTypeName"));
				lobby.setMaxTable(res.getInt("maxTable"));
				lobby.setMinPrice(res.getInt("minPrice"));
				lobby.setDeleted(res.getBoolean("isDeleted"));
				lobby.setLobbyTypeID(res.getInt("lobbyTypeID"));
				lobbyList.add(lobby);
			}
			connection.close();
			return lobbyList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	public void addLobby(Lobby sanh) {
		String query = "INSERT INTO LOBBY(lobbyName, lobbyType, maxTable) VALUES (?, ?, ?);";

		Connection connection = DBConnection.getInstance().getConnection(1);
		try {
				PreparedStatement prep = connection.prepareStatement(query);
				prep.setString(1, sanh.getLobbyName());
				prep.setInt(2, sanh.getLobbyTypeID());
				prep.setInt(3, sanh.getMaxTable());
				prep.executeUpdate();
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delele(int id) {
		Connection connection = DBConnection.getInstance().getConnection(1);
		String query = "UPDATE LOBBY SET isDeleted = ? WHERE lobbyID = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setBoolean(1, true);
			statement.setInt(2, id);
			statement.executeUpdate();
			connection.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Lobby sanh) {
		Connection connection = DBConnection.getInstance().getConnection(1);
		String query = "UPDATE LOBBY SET lobbyName = ?, maxTable = ?, lobbyType = ? WHERE lobbyID = ?";
		try {
			PreparedStatement prep = connection.prepareStatement(query);
			prep.setString(1, sanh.getLobbyName());
			prep.setInt(2, sanh.getMaxTable());
			prep.setInt(3, sanh.getLobbyTypeID());
			prep.setInt(4, sanh.getLobbyID());
			prep.executeUpdate();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
