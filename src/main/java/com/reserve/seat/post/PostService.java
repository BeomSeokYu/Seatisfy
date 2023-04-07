package com.reserve.seat.post;

import java.util.List;

public interface PostService {
	public void insertPost(PostDTO pt);
	
	public List<PostDTO> ptList();
	
	public void updatePost(PostDTO pt);
	
	public void deletePost(String pno);
	
	public PostDTO selectPost(String pno);
	
}
