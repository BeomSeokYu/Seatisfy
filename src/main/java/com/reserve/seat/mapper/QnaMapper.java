package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.Criteria;
import com.reserve.seat.qna.QnaDTO;

public interface QnaMapper {
	
	void insertQna(QnaDTO qna);
	
	List<QnaDTO> qnaAllList(Criteria cri);
	
	void updateQna(QnaDTO qna);
	
	void deleteQna(String qno);
	
	QnaDTO selectQna(String qno);

	int totalCount(Criteria cri);

	List<QnaDTO> qnaList();
}
