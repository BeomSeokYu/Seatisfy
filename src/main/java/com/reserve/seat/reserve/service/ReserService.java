package com.reserve.seat.reserve.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.Criteria;
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
	
	public ReserDTO getReserById(String username);
	
	public ReserDTO getReserByIdAndPno(
			@Param("username") String username, 
			@Param("pno")int pno);

	public void addReser(ReserDTO rdto);

	public boolean editReser(ReserDTO rdto);

	public int removeReser(int rno);

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

	public boolean reserveSeat(ReserDTO rdto, String email);

	public int removeSeat(int sno);

	public int getSeatTotalCount(Criteria criteria);
}
