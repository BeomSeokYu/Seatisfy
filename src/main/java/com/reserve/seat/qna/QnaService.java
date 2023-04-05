package com.reserve.seat.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	@Autowired
	private QnaMapper qnaMapper;
	
	public void insertQna(Qna qna) {
		qnaMapper.insertQna(qna);
	}
	
	public List<Qna> QnaAllList(){
		return qnaMapper.QnaAllList();
	}
}
