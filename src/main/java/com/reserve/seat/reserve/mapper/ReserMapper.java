package com.reserve.seat.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.reserve.domain.Criteria;
import com.reserve.seat.reserve.domain.PostDTO;


public interface ReserMapper {

	public PostDTO selectBoard(int pno);						// 게시물 가져오기
			// 댓글 수 수정
}
