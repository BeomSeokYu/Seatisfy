package com.reserve.seat.user;

import org.springframework.stereotype.Service;

@Service
public interface UserService {
	public boolean signup(UserVo uvo);
	
	public UserVo selectUser(String username);
	
}
