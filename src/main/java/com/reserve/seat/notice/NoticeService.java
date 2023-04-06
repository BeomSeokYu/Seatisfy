package com.reserve.seat.notice;

import java.util.List;

public interface NoticeService {

	public int insertNotice(NoticeDTO notice);	//공지 등록
	
	public List<NoticeDTO> AllNoticeList();		//공지 목록
	
	public NoticeDTO detailNotice(String nno);		//공지 상세보기
	
	public int updateNotice(NoticeDTO notice);	//공지 수정
	
	public int deleteNotice(String nno);	//공지 삭제
	
	public List<NoticeDTO> selectAllNotice(Criteria cri);	//공지 목록
	
	public int totalCount(Criteria cri);	// 전체 게시물 수
}
