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
		userMapper.insertUser(user);		
	}



}
