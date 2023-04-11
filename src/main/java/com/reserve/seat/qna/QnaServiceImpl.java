package com.reserve.seat.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	
	private final QnaMapper qnaMapper;
	
	public void insertQna(QnaDTO qna) {
		qnaMapper.insertQna(qna);
	}
	
	public List<QnaDTO> qnaList(Criteria cri){
		return qnaMapper.qnaList(cri);
	}
	
	public void deleteQna(String qno) {
		qnaMapper.deleteQna(qno);
	}
	
	public QnaDTO selectQna(String qno) {
		return qnaMapper.selectQna(qno);
	}
	public void updateQna(QnaDTO qna) {
		qnaMapper.updateQna(qna);
	}

	public int totalCount(Criteria cri) {
		return qnaMapper.totalCount(cri);
	}
}
