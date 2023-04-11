/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.mapper;

import java.util.List;


import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.ReserDTO;


public interface ReserMapper {
	
	// 전체 가져오기
	public List<ReserDTO> selectAllReser(Criteria criteria);
	
	// 하나 가져오기
	public ReserDTO selectReser(int rno);
	
	// 삽입
	public void insertReser(ReserDTO rdto);
	
	// 수정
	public boolean updateReser(ReserDTO rdto);
	
	// 삭제
	public int deleteReser(int rno);
	
	// 예약 수 가져오기
	public int totalCount(Criteria criteria);
}
