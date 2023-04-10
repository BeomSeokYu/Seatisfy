package com.reserve.seat.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.seat.mapper.NoticeMapper;
import com.reserve.seat.mapper.ReplyMapper;
import com.reserve.seat.notice.Criteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper replyMapper;
	
	
	@Override
	//댓글 등록 
	public void insertReply(ReplyDTO reply) {
		replyMapper.insertReply(reply);
	}

	@Override
	//댓글 수정
	public void updateReply(ReplyDTO reply) {
		replyMapper.updateReply(reply);
	}

	@Override
	//댓글 삭제
	public void deleteReply(int rno) {
		replyMapper.deleteReply(rno);
	}

//	@Override
//	//댓글 조회
//	public List<ReplyDTO> selectReply(int rno) {
//		return replyMapper.selectReply(rno);
//	}

	

}
