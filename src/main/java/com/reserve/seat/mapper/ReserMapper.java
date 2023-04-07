package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.qna.QnaDTO;
import com.reserve.seat.reservation.ReserDTO;

public interface ReserMapper {
	
	void insertReser(ReserDTO res);
	
	List<ReserDTO> reserList();
	
	void updateReser(ReserDTO rno);
	
	void deleteReser(String rno);
	
	ReserDTO selectReser(String rno);

	
}
