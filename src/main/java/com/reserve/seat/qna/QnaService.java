package com.reserve.seat.qna;

import java.util.List;

import com.reserve.seat.Criteria;

public interface QnaService {
	public void insertQna(QnaDTO qna);
	
	public List<QnaDTO> qnaList();
	
	public List<QnaDTO> qnaAllList(Criteria cri);
	
	public void updateQna(QnaDTO qna);
	
	public void deleteQna(String qno);
	
	public QnaDTO selectQna(String qno);
	
	public int totalCount(Criteria cri);
}
