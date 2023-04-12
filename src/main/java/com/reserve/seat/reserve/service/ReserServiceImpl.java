package com.reserve.seat.reserve.service;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.NewExpr;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class ReserServiceImpl implements ReserService {
	private final PostMapper postMapper;
	private final ReserMapper reserMapper;
	private final SeatMapper seatMapper;


	/**
	 * ReserService -----------------------------------
	 */
	@Override
	public List<ReserDTO> getMyReserList(int amount, int offset, String username) {
		return reserMapper.selectAllReserById(amount, offset, username);
	}

	@Override
	public ReserDTO getReser(int rno) {
		return reserMapper.selectReser(rno);
	}

	@Override
	public ReserDTO getReserById(String username) {
		return reserMapper.selectReserById(username);
	}
	
	@Override
	public ReserDTO getReserByIdAndPno(String username, int pno) {
		return reserMapper.selectReserByIdAndPno(username, pno);
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
	public int getReserTotalCount() {
		return reserMapper.totalCount();
	}
	
	
	
	/**
	 * PostService -----------------------------------
	 */
	@Override
	public List<PostDTO> getPostList(Criteria criteria) {
		return postMapper.selectAllPost(criteria);
	}
	
	@Override
	public List<PostDTO> getPostListById(int amount, int offset, String[] typeArr, String keyword, String pwriter) {
		return postMapper.selectAllPostById(amount, offset, typeArr, keyword, pwriter);
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
	
	@Override
	public int getPostTotalCountById(int amount, int offset, String[] typeArr, String keyword, String pwriter) {
		return postMapper.totalCountById(amount, offset, typeArr, keyword, pwriter);
	}
	
	
	/**
	 * SeatService -------------------------------------
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
	public List<Integer> getSeatsByPost(int pno) {
		return seatMapper.selectSeatsByPost(pno);
	}

	@Override
	public void addSeat(String seatinfo, int pno) {
		int seatNum = 1;
		for (String row : seatinfo.split(" ")) {
			for (String col : row.split(",")) {
				if (col.equals("1")) {
					SeatDTO sdto = new SeatDTO(null, seatNum++, pno, false);
					seatMapper.insertSeat(sdto);					
				}
			}
		}
		
	}
	
	@Transactional
	@Override
	public boolean reserveSeat(ReserDTO rdto, String email) {
		SeatDTO updateSeatDTO = seatMapper.selectSeatLock(
				new SeatDTO(null, rdto.getSeatnum(), rdto.getPno(), null));
		if (!updateSeatDTO.getIsreserved()) {
			reserMapper.insertReser(rdto);
			updateSeatDTO.setIsreserved(true);
			return seatMapper.updateSeat(updateSeatDTO);			
		} else {
			seatMapper.updateSeat(updateSeatDTO);
			return false;
		}
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
