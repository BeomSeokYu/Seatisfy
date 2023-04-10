package com.reserve.seat.reply;

import java.util.List;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.notice.NoticeDTO;


public interface ReplyService {

	public boolean insertReply(ReplyDTO reply);		//댓글 등록 
	public boolean updateReply(ReplyDTO reply);		//댓글 수정
	public boolean deleteReply(String rno);			//댓글 삭제
	public ReplyDTO selectReply(String rno);						//댓글 조회
	public ReplyPageDTO AllReplyList(String nno, Criteria cri);	//전체 댓글 목록
//	public int totalReply(int nno);	// 전체 댓글 수
}
