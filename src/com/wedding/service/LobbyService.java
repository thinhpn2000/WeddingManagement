package com.wedding.service;

import java.util.List;

import com.wedding.models.Lobby;

public interface LobbyService {
	List<Lobby> getAllLobby();
	void addLobby(Lobby sanh);
	void deleteLobby(int id);
	void updateLobby(Lobby sanh);
}
