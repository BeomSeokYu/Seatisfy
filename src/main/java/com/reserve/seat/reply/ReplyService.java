package com.reserve.seat.reply;

import java.util.List;

import com.reserve.seat.notice.Criteria;

public interface ReplyService {

	public int insertReply(ReplyDTO reply);	//댓글 등록 
	public int updateReply(ReplyDTO reply);	//댓글 수정
	public int deleteReply(int rno);	//댓글 삭제
//	public List<ReplyDTO> selectReply(int rno);	//댓글 조회
//	public int totalReply(int nno);	// 전체 댓글 수
}
