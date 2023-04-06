package com.reserve.seat.reserve.service;

import java.util.List;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.SeatDTO;

public interface SeatService {

	// 게시물 전체 가져오기
	public List<SeatDTO> getSeatList(Criteria criteria);
	
	// 게시물 하나 가져오기
	public SeatDTO getSeat(int sno);
	
	// 게시물 삽입
	public void addSeat(SeatDTO sdto);
	
	// 게시물 수정
	public boolean editSeat(SeatDTO sdto);
	
	// 게시물 삭제
	public int removeSeat(int sno);
	
	// 게시물 수 가져오기
	public int getSeatTotalCount(Criteria criteria);
}
