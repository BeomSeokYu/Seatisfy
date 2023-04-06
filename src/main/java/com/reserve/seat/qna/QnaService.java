package com.reserve.seat.qna;

import java.util.List;

public interface QnaService {
	public void insertQna(QnaDTO qna);
	
	public List<QnaDTO> qnaList();
	
	public void updateQna(QnaDTO qna);
	
	public void deleteQna(String qno);
	
	public QnaDTO selectQna(String qno);
	
}
