package com.reserve.seat.reserve.service;

import java.util.List;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.PostDTO;

public interface PostService {

	// 게시물 전체 가져오기
	public List<PostDTO> getPostList(Criteria criteria);
	
	// 게시물 하나 가져오기
	public PostDTO getPost(int pno);
	
	// 게시물 삽입
	public void addPost(PostDTO pdto);
	
	// 게시물 수정
	public boolean editPost(PostDTO pdto);
	
	// 게시물 삭제
	public int removePost(int pno);
	
	// 게시물 수 가져오기
	public int getPostTotalCount(Criteria criteria);
}
