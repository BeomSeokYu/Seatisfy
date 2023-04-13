package com.reserve.seat.notice;

import java.util.List;
import java.util.Map;

import com.reserve.seat.Criteria;
import com.reserve.seat.reply.ReplyDTO;

public interface NoticeService {

	public void insertNotice(NoticeDTO notice);	//공지 등록
	
	public void updateNotice(NoticeDTO notice);	//공지 수정
	
	public void deleteNotice(String nno);	//공지 삭제

	public NoticeDTO detailNotice(String nno);		//공지 상세보기
	
	public List<NoticeDTO> AllNoticeList();		//공지 목록
	
	public List<NoticeDTO> selectAllNotice(Criteria cri);	//페이징처리 공지 목록
	
	public int totalCount(Criteria cri);	// 전체 공지 수
	
	public void updateHit(String nno); // 조회수 증가
	
}
