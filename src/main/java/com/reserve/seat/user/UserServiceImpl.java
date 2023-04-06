package com.reserve.seat.user;

import org.springframework.stereotype.Service;

import com.reserve.seat.mapper.UserMapper;

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

	@Override
	public void name() {
		System.out.println("User Service Impl - test");
	}


//	@Override
//	public User selectUser(String username) {
//		
//		return userMapper.selectUser(username);
//	}
	

}
