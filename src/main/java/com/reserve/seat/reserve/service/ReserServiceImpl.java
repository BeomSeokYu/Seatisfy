package com.reserve.seat.reserve.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.PostMapper;
import com.reserve.seat.mapper.ReserMapper;
import com.reserve.seat.mapper.SeatMapper;
import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.domain.ReserDTO;
import com.reserve.seat.reserve.domain.SeatDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReserServiceImpl implements PostService, ReserService, SeatService{
	private final PostMapper postMapper;
	private final ReserMapper reserMapper;
	private final SeatMapper seatMapper;
	
	/**
	 * PostService ------------------------------------------
	 */
	
	@Override
	public List<PostDTO> getPostList(Criteria criteria) {
		return postMapper.selectAllPost(criteria);
	}

	@Override
	public PostDTO getPost(int pno) {
		return postMapper.selectPost(pno);
	}

	@Override
	public void addPost(PostDTO pdto) {
		postMapper.insertPost(pdto);
	}

	@Override
	public boolean editPost(PostDTO pdto) {
		return postMapper.updatePost(pdto);
	}

	@Override
	public int removePost(int pno) {
		return postMapper.deletePost(pno);
	}

	@Override
	public int getPostTotalCount(Criteria criteria) {
		return postMapper.totalCount(criteria);
	}

	/**
	 * ReserService -----------------------------------
	 */
	@Override
	public List<ReserDTO> getReserList(Criteria criteria) {
		return reserMapper.selectAllReser(criteria);
	}

	@Override
	public ReserDTO getReser(int rno) {
		return reserMapper.selectReser(rno);
	}

	@Override
	public void addReser(ReserDTO rdto) {
		reserMapper.insertReser(rdto);
	}

	@Override
	public boolean editReser(ReserDTO rdto) {
		return reserMapper.updateReser(rdto);
	}

	@Override
	public int removeReser(int rno) {
		return reserMapper.deleteReser(rno);
	}

	@Override
	public int getReserTotalCount(Criteria criteria) {
		return reserMapper.totalCount(criteria);
	}
	
	
	
	
	/**
	 * ReserService -------------------------------------
	 */
	@Override
	public List<SeatDTO> getSeatList(Criteria criteria) {
		return null;
	}

	@Override
	public SeatDTO getSeat(int sno) {
		return seatMapper.selectSeat(sno);
	}

	@Override
	public void addSeat(SeatDTO sdto) {
		seatMapper.insertSeat(sdto);
	}

	@Override
	public boolean editSeat(SeatDTO sdto) {
		return seatMapper.updateSeat(sdto);
	}

	@Override
	public int removeSeat(int sno) {
		return seatMapper.deleteSeat(sno);
	}

	@Override
	public int getSeatTotalCount(Criteria criteria) {
		return seatMapper.totalCount(criteria);
	}

}
