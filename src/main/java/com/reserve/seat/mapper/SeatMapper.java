/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.SeatDTO;


public interface SeatMapper {
	
	// 전체 가져오기
	public List<SeatDTO> selectAllSeat(Criteria criteria);
	
	// 게시물의 좌석 정보 가져오기
	public List<Integer> selectSeatsByPost(int pno);
	
	// 하나 가져오기
	public SeatDTO selectSeat(int sno);
	
	// 게시물의 좌석 정보 락 걸기
	public SeatDTO selectSeatLock(SeatDTO seatDTO);
	
	// 삽입
	public void insertSeat(SeatDTO sdto);
	
	// 수정
	public int updateSeat(
			@Param("seatnum")int seatnum, 
			@Param("pno")int pno, 
			@Param("isreserved")boolean isreserved);
	
	// 삭제
	public int deleteSeatByPost(@Param("username")int seatnum, @Param("pno")int pno);
	
	// 예약 수 가져오기
	public int totalCount(Criteria criteria);
}
