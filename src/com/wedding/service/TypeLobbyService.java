package com.wedding.service;

import java.util.List;

import com.wedding.models.TypeLobby;

public interface TypeLobbyService {
	void addTypeLobby(TypeLobby type);
	List<TypeLobby> getAllTypeLobby();
}
