/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.ReserDTO;


public interface ReserMapper {
	
	// 전체 가져오기
	public List<ReserDTO> selectAllReserById(
			@Param("amount") int amount, 
			@Param("offset") int offset, 
			@Param("username") String username);
	
	// 하나 가져오기
	public ReserDTO selectReser(int rno);

	// 하나 가져오기
	public ReserDTO selectReserById(String username);
	
	// 하나 가져오기
	public ReserDTO selectReserByIdAndPno(String username, int pno);
	
	// 삽입
	public void insertReser(ReserDTO rdto);
	
	// 수정
	public boolean updateReser(ReserDTO rdto);
	
	// 삭제
	public int deleteReser(int rno);
	
	// 예약 수 가져오기
	public int totalCount();
}
