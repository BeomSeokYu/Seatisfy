package com.reserve.seat.notice;

import java.util.List;

public interface NoticeService {

	public boolean insertNotice(NoticeDTO notice);	//공지 등록
	
	public boolean updateNotice(NoticeDTO notice);	//공지 수정
	
	public boolean deleteNotice(int nno);	//공지 삭제

	public NoticeDTO detailNotice(int nno);		//공지 상세보기
	
	public List<NoticeDTO> AllNoticeList();		//공지 목록
	
	public List<NoticeDTO> selectAllNotice(Criteria cri);	//페이징처리 공지 목록
	
	public int totalCount(Criteria cri);	// 전체 공지 수
}
