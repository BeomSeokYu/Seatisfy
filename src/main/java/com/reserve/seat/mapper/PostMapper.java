package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.post.PostDTO;

public interface PostMapper {
	
	void insertPost(PostDTO pt);
	
	List<PostDTO> ptList();
	
	void updatePost(PostDTO pt);
	
	void deletePost(String pno);
	
	PostDTO selectPost(String pno);

	
}
