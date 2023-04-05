/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.reserve.domain.Criteria;
import com.reserve.seat.reserve.domain.PostDTO;


public interface ReserMapper {

	public PostDTO selectPost(int pno);		// 게시물 가져오기

	public void insertPost(PostDTO pdto);				// 댓글 수 수정
}
