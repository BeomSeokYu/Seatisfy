/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.mapper;

import java.util.List;


import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.SeatDTO;


public interface SeatMapper {
	
	// 전체 가져오기
	public List<SeatDTO> selectAllSeat(Criteria criteria);
	
	// 하나 가져오기
	public SeatDTO selectSeat(int sno);
	
	// 게시물의 좌석 정보 가져오기
	public List<SeatDTO> selectSeatsByPost(int pno);
	
	// 삽입
	public void insertSeat(SeatDTO sdto);
	
	// 수정
	public boolean updateSeat(SeatDTO sdto);
	
	// 삭제
	public int deleteSeat(int sno);
	
	// 예약 수 가져오기
	public int totalCount(Criteria criteria);
}
