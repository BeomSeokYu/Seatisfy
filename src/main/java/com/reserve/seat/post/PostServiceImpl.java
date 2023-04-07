package com.reserve.seat.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.seat.mapper.PostMapper;
import com.reserve.seat.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
	
	private final PostMapper postMapper;
	
	public void insertPost(PostDTO pt) {
		postMapper.insertPost(pt);
	}
	
	public List<PostDTO> ptList(){
		return postMapper.ptList();
	}
	
	public void deletePost(String pno) {
		postMapper.deletePost(pno);
	}
	
	public PostDTO selectPost(String pno) {
		return postMapper.selectPost(pno);
	}
	public void updatePost(PostDTO pt) {
		postMapper.updatePost(pt);
	}
}
