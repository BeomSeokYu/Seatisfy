package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.reply.ReplyDTO;

public interface ReplyMapper {
	public void insertReply(ReplyDTO reply);	//댓글 등록 
	public void updateReply(ReplyDTO reply);	//댓글 수정
	public void deleteReply(String rno);		//댓글 삭제
	public List<ReplyDTO> selectReplyList(String nno);	//댓글 조회
	public List<ReplyDTO> selectReplyAllPaging(Criteria cri); //전체 댓글 목록 페이징
	public int totalReply(int nno);	// 전체 댓글 수
}
