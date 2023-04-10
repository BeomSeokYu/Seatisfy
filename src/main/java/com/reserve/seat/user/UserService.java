package com.reserve.seat.user;

import java.util.List;

public interface UserService {
	public void signup(User user);

	public boolean changeTmpPw(User user);
	public boolean changePw(User user);
	
	public List<User> getAllUser();
	
	public boolean changeAutority(User user);
	
	public boolean removeUser(int uno);
	
	public User getUserDetail(String username);
	
	public boolean editUser(User user);
	
}
