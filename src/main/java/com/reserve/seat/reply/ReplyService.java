package com.reserve.seat.reply;

import java.util.List;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.notice.NoticeDTO;

public interface ReplyService {

	public boolean insertReply(ReplyDTO reply);	//댓글 등록 
	public boolean updateReply(ReplyDTO reply);	//댓글 수정
	public boolean deleteReply(String rno);	//댓글 삭제
	public List<ReplyDTO> AllReplyList(String nno);		//공지 목록
//	public List<ReplyDTO> selectReply(int rno);	//댓글 조회
//	public int totalReply(int nno);	// 전체 댓글 수
}
