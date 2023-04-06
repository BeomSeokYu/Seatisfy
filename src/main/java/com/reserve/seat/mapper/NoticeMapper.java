// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:37
package com.reserve.seat.mapper;

import java.util.List;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.notice.NoticeDTO;


public interface NoticeMapper {

	
	public void insertNotice(NoticeDTO notice);	//공지 등록
	
	public List<NoticeDTO> AllNoticeList();		//공지 목록
	
	public NoticeDTO detailNotice(String nno);		//공지 상세보기
	
	public void updateNotice(NoticeDTO notice);	//공지 수정
	
	public void deleteNotice(String nno);	//공지 삭제
	
	public List<NoticeDTO> selectAllNotice(Criteria cri);	//공지 목록
	
	public int totalCount(Criteria cri);	// 전체 게시물 수
	
	

	
	
}
