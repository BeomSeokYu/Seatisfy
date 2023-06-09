package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.Criteria;
import com.reserve.seat.user.User;

public interface UserMapper {

	public void insertUser(User user);

	public User findById(String username);
	public String findIdByName(User user);
	
	public int updatePassword(User user);
	
	public int updateUser(User user);
	
	public int deleteUser(int uno);
	
	public List<User> listUser(Criteria cri);
	
	public int updateAuthority(User user);
	
	public int totalCount(Criteria cri);	// 전체 게시물 수
	
}
