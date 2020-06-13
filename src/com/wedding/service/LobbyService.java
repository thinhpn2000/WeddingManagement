package com.wedding.service;

import java.util.List;

import com.wedding.models.Lobby;

public interface LobbyService {
	void addLobby(Lobby sanh);
	void deleteLobby(int id);
	Lobby getLobbyById(int id);
	List<Lobby> getAllLobby();
	void updateLobby(Lobby sanh);
}
