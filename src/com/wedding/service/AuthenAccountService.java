package com.wedding.service;

import com.wedding.dto.UserDTO;

public interface AuthenAccountService {
	public UserDTO authenAccountLogin(String username, String password);
}
