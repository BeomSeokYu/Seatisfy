package com.reserve.seat.mapper;


import com.reserve.seat.reply.ReplyDTO;

public interface ReplyMapper {
	public int insertReply(ReplyDTO reply);	//댓글 등록 
	public int updateReply(ReplyDTO reply);	//댓글 수정
	public int deleteReply(int rno);		//댓글 삭제
//	public ReplyDTO selectReply(int rno);	//댓글 조회
}
