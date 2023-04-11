package com.reserve.seat.reserve.service;

import java.util.List;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.domain.ReserDTO;
import com.reserve.seat.reserve.domain.SeatDTO;

public interface ReserService {

	/**
	 * ReserService -----------------------------------
	 */
	public List<ReserDTO> getReserList(Criteria criteria);

	public ReserDTO getReser(int rno);

	public void addReser(ReserDTO rdto);

	public boolean editReser(ReserDTO rdto);

	public int removeReser(int rno);

	public int getReserTotalCount(Criteria criteria);
	
	
	/**
	 * PostService ------------------------------------------
	 */
	
	public List<PostDTO> getPostList(Criteria criteria);

	public PostDTO getPost(int pno);

	public void addPost(PostDTO pdto);

	public boolean editPost(PostDTO pdto);

	public int removePost(int pno);

	public int getPostTotalCount(Criteria criteria);
	
	
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
