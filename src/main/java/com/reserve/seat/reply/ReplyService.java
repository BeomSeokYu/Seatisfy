package com.reserve.seat.reply;

import java.util.List;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.notice.NoticeDTO;


public interface ReplyService {

	public int insertReply(ReplyDTO reply);		//댓글 등록 
	public int updateReply(ReplyDTO reply);		//댓글 수정
	public int deleteReply(String rno);			//댓글 삭제
	public ReplyDTO selectReply(String rno);		//댓글 조회
	public List<ReplyDTO> replyList(String nno); //전체 댓글 목록
}
