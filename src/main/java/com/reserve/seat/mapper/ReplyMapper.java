package com.reserve.seat.mapper;


import java.util.List;

import com.reserve.seat.notice.NoticeDTO;
import com.reserve.seat.reply.ReplyDTO;

public interface ReplyMapper {
	public int insertReply(ReplyDTO reply);	//댓글 등록 
	public int updateReply(ReplyDTO reply);	//댓글 수정
	public int deleteReply(String rno);		//댓글 삭제
	public List<ReplyDTO> AllReplyList(String nno);	 //전체 댓글 목록
}
