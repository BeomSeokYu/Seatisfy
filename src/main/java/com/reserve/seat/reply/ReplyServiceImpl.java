package com.reserve.seat.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.reserve.seat.mapper.NoticeMapper;
import com.reserve.seat.mapper.ReplyMapper;
import com.reserve.seat.notice.Criteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper replyMapper;
	private NoticeMapper noticeMapper;
	
	@Transactional
	@Override
	//댓글 등록 
	public boolean insertReply(ReplyDTO reply) {
		noticeMapper.updateReplyCnt(reply.getNno(), 1);
		return replyMapper.insertReply(reply) == 1 ? true : false;
	}

	@Override
	//댓글 수정
	public boolean updateReply(ReplyDTO reply) {
		return replyMapper.updateReply(reply) == 1 ? true : false;
	}

	@Transactional
	@Override
	//댓글 삭제
	public boolean deleteReply(String rno) {
		ReplyDTO reply = replyMapper.selectReply(rno);	//번호를 받아와서
		noticeMapper.updateReplyCnt(reply.getNno(), -1);
		return replyMapper.deleteReply(rno) == 1 ? true : false;
	}
	
	@Override
	//댓글 조회
	public ReplyDTO selectReply(String rno) {
		return replyMapper.selectReply(rno);
	}
	
	//전체 댓글 목록
	@Override
	public ReplyPageDTO AllReplyList(String nno, Criteria cri){
		return new ReplyPageDTO(replyMapper.totalReply(nno),
				replyMapper.AllReplyList(nno, cri));
	}



	

}
