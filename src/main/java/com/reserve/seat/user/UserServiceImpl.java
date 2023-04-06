package com.reserve.seat.user;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	
	private final UserMapper userMapper;

	@Override
	public void signup(User user) {
		System.out.println("User Service Impl - signup()" + user.getUsername());
		userMapper.insertUser(user);		
	}


//	@Override
//	public User selectUser(String username) {
//		
//		return userMapper.selectUser(username);
//	}
	

}
