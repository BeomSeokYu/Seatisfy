/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.PostDTO;


public interface ReserMapper {
	
	// 게시물 전체 가져오기
	public List<PostDTO> selectAllPost(Criteria criteria);
	
	// 게시물 하나 가져오기
	public PostDTO selectPost(int pno);
	
	// 게시물 삽입
	public void insertPost(PostDTO pdto);
	
	// 게시물 수정
	public boolean updatePost(PostDTO pdto);
	
	// 게시물 삭제
	public int deletePost(int pno);
	
	// 게시물 수 가져오기
	public int totalCount(Criteria criteria);
}
