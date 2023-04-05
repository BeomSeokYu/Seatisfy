package com.reserve.seat.qna;

import java.util.List;

public interface QnaMapper {
	
	void insertQna(Qna qna);
	
	List<Qna> QnaAllList();
}
