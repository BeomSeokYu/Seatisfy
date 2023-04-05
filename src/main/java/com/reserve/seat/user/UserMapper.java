package com.reserve.seat.user;

public interface UserMapper {

	public int insertUser(UserVo uvo);
	
	public UserVo selectUser(String username);
	
}
