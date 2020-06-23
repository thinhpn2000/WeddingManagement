package com.wedding.serviceImpl;

import com.wedding.dto.UserDTO;
import com.wedding.repository.AuthenAccountRepository;
import com.wedding.service.AuthenAccountService;

public class AuthenAccountServiceImpl implements AuthenAccountService {
	
	private AuthenAccountRepository authenAccountRepository;
	public AuthenAccountServiceImpl() {
		authenAccountRepository = new AuthenAccountRepository();
	} 
	@Override
	public UserDTO authenAccountLogin(String username, String password) {
		return authenAccountRepository.authenLogin(username, password);
	}

}
