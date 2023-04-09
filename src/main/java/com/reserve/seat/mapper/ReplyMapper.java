package com.reserve.seat.mapper;


import com.reserve.seat.notice.Criteria;
import com.reserve.seat.reply.ReplyDTO;

public interface ReplyMapper {
	public boolean insertReply(ReplyDTO reply);	//댓글 등록 
	public boolean updateReply(ReplyDTO reply);	//댓글 수정
	public boolean deleteReply(int rno);		//댓글 삭제
	public ReplyDTO selectReply(int rno);	//댓글 조회
}
