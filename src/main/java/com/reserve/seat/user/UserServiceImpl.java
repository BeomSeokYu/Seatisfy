package com.reserve.seat.user;

public class UserServiceImpl implements UserService{
	
	private UserMapper userMapper;

	@Override
	public boolean signup(UserVo uvo) {
		
		return userMapper.insertUser(uvo) == 1 ? true : false;
	}

	@Override
	public UserVo selectUser(String username) {
		
		return userMapper.selectUser(username);
	}
	

}
