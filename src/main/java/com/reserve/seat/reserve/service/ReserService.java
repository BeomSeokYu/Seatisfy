package com.reserve.seat.reserve.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.Criteria;
import com.reserve.seat.reply.ReplyDTO;
import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.domain.ReserDTO;
import com.reserve.seat.reserve.domain.SeatDTO;

public interface ReserService {

	/**
	 * ReserService -----------------------------------
	 */
	public List<ReserDTO> getMyReserList(
			@Param("amount") int amount, 
			@Param("offset") int offset, 
			@Param("username") String username);

	public ReserDTO getReser(int rno);
	
	public List<ReserDTO> getReserById(String username);
	
	public ReserDTO getReserByIdAndPno(
			@Param("username") String username, 
			@Param("pno")int pno);

	public void addReser(ReserDTO rdto);

	public int getReserTotalCount();
	
	
	/**
	 * PostService ------------------------------------------
	 */
	
	public List<PostDTO> getPostList(Criteria criteria);

	public List<PostDTO> getPostListById(
			@Param("amount") int amount,
			@Param("offset") int offset,
			@Param("typeArr") String[] typeArr,
			@Param("keyword") String keyword,
			@Param("pwriter") String pwriter);

	public PostDTO getPost(int pno);

	public void addPost(PostDTO pdto);

	public boolean editPost(PostDTO pdto);

	public int removePost(int pno);

	public int getPostTotalCount(Criteria criteria);
	
	public int getPostTotalCountById(
			@Param("amount") int amount,
			@Param("offset") int offset,
			@Param("typeArr") String[] typeArr,
			@Param("keyword") String keyword,
			@Param("pwriter") String pwriter);
	
	
	/**
	 * SeatService -------------------------------------
	 */
	public List<SeatDTO> getSeatList(Criteria criteria);
	
	public List<Integer> getSeatsByPost(int pno);
	
	public SeatDTO getSeat(int sno);

	public void addSeat(String seatinfo, int pno);

	public int deleteSeatByPost(
			@Param("seatnum") int seatnum, 
			@Param("pno")int pno);

	public int getSeatTotalCount(Criteria criteria);
	
	/**
	 * CombinationService -------------------------------------
	 */
	
	public boolean reserveSeat(ReserDTO rdto);
	
	public boolean cancelReser(
			@Param("seatnum") int seatnum, 
			@Param("username") String username, 
			@Param("pno")int pno);
	
	public void insertReply(ReplyDTO replyDTO);	//댓글 등록
	
	public void updateReply(ReplyDTO replyDTO);	//댓글 수정
	
	public void deleteReply(int rno); //댓글 삭제

	public ReplyDTO selectReply(String rno);	//특정 댓글 하나 조회
	
	public List<ReplyDTO> AllReplyList(int amount, int offset, int pno); //전체 댓글 조회
	
	public int getReplyTotalCount(int pno); //전체 댓글 조회

}
