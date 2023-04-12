package com.reserve.seat.qna;

import java.util.List;

import org.springframework.stereotype.Service;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.QnaMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	
	private final QnaMapper qnaMapper;
	@Override
	public void insertQna(QnaDTO qna) {
		qnaMapper.insertQna(qna);
	}
	@Override
	public List<QnaDTO> qnaList(){
		return qnaMapper.qnaList();
	}
	@Override
	public void deleteQna(String qno) {
		qnaMapper.deleteQna(qno);
	}
	@Override
	public QnaDTO selectQna(String qno) {
		return qnaMapper.selectQna(qno);
	}
	@Override
	public void updateQna(QnaDTO qna) {
		qnaMapper.updateQna(qna);
	}
	@Override
	public int totalCount(Criteria cri) {
		return qnaMapper.totalCount(cri);
	}

	@Override
	public List<QnaDTO> qnaAllList(Criteria cri) {
		return qnaMapper.qnaAllList(cri);
	}
}
