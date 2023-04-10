package com.reserve.seat.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.reply.ReplyDTO;

public interface ReplyMapper {
	public int insertReply(ReplyDTO reply);	//댓글 등록 
	public int updateReply(ReplyDTO reply);	//댓글 수정
	public int deleteReply(String rno);		//댓글 삭제
	public ReplyDTO selectReply(String rno);	//댓글 조회
	public List<ReplyDTO> AllReplyList(@Param("nno") String nno,
									   @Param("cri") Criteria cri);	 //전체 댓글 목록
	public int totalReply(String rno);	// 전체 댓글 수
}
