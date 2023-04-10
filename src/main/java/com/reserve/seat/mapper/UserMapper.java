package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.user.User;

public interface UserMapper {

	public void insertUser(User user);

	public User findById(String username);
	
	public int updatePassword(User user);
	
	public int updateUser(User user);
	
	public int deleteUser(int uno);
	
	public List<User> listUser();
	
	public int updateAuthority(User user);
	
}
