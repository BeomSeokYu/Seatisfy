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
	public List<ReserDTO> selectReserById(@Param("username") String username);
	
	// 하나 가져오기
	public ReserDTO selectReserByIdAndPno(
			@Param("username") String username, 
			@Param("pno")int pno);
	
	// 삽입
	public int insertReser(ReserDTO rdto);
	
	// 삭제
	public int deleteReser(
			@Param("username") String username, 
			@Param("pno")int pno);
	
	// 예약 수 가져오기
	public int totalCount();
}
