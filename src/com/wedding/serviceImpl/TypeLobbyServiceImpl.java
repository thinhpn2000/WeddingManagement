package com.wedding.serviceImpl;

import java.util.List;

import com.wedding.models.TypeLobby;
import com.wedding.repository.TypeLobbyRepository;
import com.wedding.service.TypeLobbyService;

public class TypeLobbyServiceImpl implements TypeLobbyService{
	private TypeLobbyRepository typeLobbyRepository;
	public TypeLobbyServiceImpl() {
		typeLobbyRepository = new TypeLobbyRepository();
	}

	@Override
	public void addTypeLobby(TypeLobby type) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TypeLobby> getAllTypeLobby() {
		// TODO Auto-generated method stub
		return typeLobbyRepository.getAll();
	}

}
