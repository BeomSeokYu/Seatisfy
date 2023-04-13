/**
 * 작성자 : 유범석
 * 작성일 : 23-04-05
 */

package com.reserve.seat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.reserve.seat.reply.ReplyDTO;


public interface ReplyMapper {
	
	public void insertReply(ReplyDTO replyDTO);	//댓글 등록
	
	public void updateReply(ReplyDTO replyDTO);	//댓글 수정
	
	public void deleteReply(int rno); //댓글 삭제
	
	public ReplyDTO selectReply(String rno);	//특정 댓글 하나 조회
	
	public List<ReplyDTO> AllReplyList(
			@Param("amount") int amount,
			@Param("offset") int offset,
			@Param("pno") int pno); //전체 댓글 조회
	
	public int totalCount(int pno);
}
