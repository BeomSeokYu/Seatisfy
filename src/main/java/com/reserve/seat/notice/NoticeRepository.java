// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:37
package com.reserve.seat.notice;

import java.util.List;


public interface NoticeRepository {

	
	void insertNotice(NoticeDTO notice);	//공지 등록
	
	List<NoticeDTO> AllNoticeList();		//공지 목록
	
	NoticeDTO detailNotice(String nno);		//공지 상세보기
	
	void updateNotice(NoticeDTO notice);	//공지 수정
	
	void deleteNotice(String nno);	//공지 삭제
	
	
	

	
	
}
