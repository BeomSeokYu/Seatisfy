package com.reserve.seat.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.reply.ReplyDTO;

public interface ReplyMapper {
	public int insertReply(ReplyDTO reply);	//댓글 등록 
	public int updateReply(ReplyDTO reply);	//댓글 수정
	public int deleteReply(String rno);		//댓글 삭제
	public ReplyDTO selectReply(String rno);	//특정 댓글 하나 조회
	public List<ReplyDTO> replyList(String nno);	// 공지사항 하나에 전체 댓글 조회
}
