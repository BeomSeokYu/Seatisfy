package com.reserve.seat.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.NoticeMapper;
import com.reserve.seat.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper replyMapper;
	
	@Override
	//댓글 등록 
	public int insertReply(ReplyDTO reply) {
		return replyMapper.insertReply(reply);
	}

	@Override
	//댓글 수정
	public int updateReply(ReplyDTO reply) {
		return replyMapper.updateReply(reply);
	}

	@Override
	//댓글 삭제
	public int deleteReply(String rno) {
		return replyMapper.deleteReply(rno);
	}
	
	@Override
	//댓글 조회
	public ReplyDTO selectReply(String rno) {
		return replyMapper.selectReply(rno);
	}
	
	//전체 댓글 목록
	@Override
	public List<ReplyDTO> replyList(ReplyCriteria cri, String nno){
		return replyMapper.replyList(cri, nno);
	}
	
	@Override
	public int replyCnt(String nno) {
		return replyMapper.replyCnt(nno);
	}



	

}
