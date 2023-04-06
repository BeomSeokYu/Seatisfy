package com.reserve.seat.reserve.service;

import java.util.List;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.ReserDTO;

public interface ReserService {

	// 전체 가져오기
	public List<ReserDTO> getReserList(Criteria criteria);
	
	// 하나 가져오기
	public ReserDTO getReser(int rno);
	
	// 게시물 삽입
	public void addReser(ReserDTO rdto);
	
	// 게시물 수정
	public boolean editReser(ReserDTO rdto);
	
	// 게시물 삭제
	public int removeReser(int rno);
	
	// 게시물 수 가져오기
	public int getReserTotalCount(Criteria criteria);
}
