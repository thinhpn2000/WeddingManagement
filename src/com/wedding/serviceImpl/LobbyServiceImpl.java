package com.wedding.serviceImpl;

import java.util.List;

import com.wedding.models.Lobby;
import com.wedding.repository.LobbyRepository;
import com.wedding.service.LobbyService;

public class LobbyServiceImpl implements LobbyService {
	
	private LobbyRepository lobbyRepository;
	
	public LobbyServiceImpl() {
		lobbyRepository = new LobbyRepository();
	}
	
	@Override
	public List<Lobby> getAllLobby() {
		return lobbyRepository.getAll();
	}
	
	@Override
	public void addLobby(Lobby sanh) {
		lobbyRepository.addLobby(sanh);
	}

	@Override
	public void deleteLobby(int id) {
		lobbyRepository.delele(id);
		
	}

	@Override
	public void updateLobby(Lobby sanh) {
		lobbyRepository.update(sanh);
	}

}
