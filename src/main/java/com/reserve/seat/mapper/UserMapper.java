package com.reserve.seat.mapper;

import com.reserve.seat.user.User;

public interface UserMapper {

	public void insertUser(User user);

	public User findById(String username);
	
	public int updatePassword(User user);
	
}
