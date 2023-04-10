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
	public boolean insertReply(ReplyDTO reply) {
		return replyMapper.insertReply(reply) == 1 ? true : false;
	}

	@Override
	//댓글 수정
	public boolean updateReply(ReplyDTO reply) {
		return replyMapper.updateReply(reply) == 1 ? true : false;
	}

	@Override
	//댓글 삭제
	public boolean deleteReply(String rno) {
		return replyMapper.deleteReply(rno) == 1 ? true : false;
	}
	
	@Override
	public List<ReplyDTO> AllReplyList(String nno){
		return replyMapper.AllReplyList(nno);
	}

//	@Override
//	//댓글 조회
//	public List<ReplyDTO> selectReply(int rno) {
//		return replyMapper.selectReply(rno);
//	}

	

}
