// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:37
package com.reserve.seat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.reserve.seat.notice.Criteria;
import com.reserve.seat.notice.NoticeDTO;


public interface NoticeMapper {

	
	public int insertNotice(NoticeDTO notice);	//공지 등록
	
	public int updateNotice(NoticeDTO notice);	//공지 수정
	
	public int deleteNotice(int nno);	//공지 삭제
	
	public NoticeDTO detailNotice(int nno);		//공지 상세보기
	
	public List<NoticeDTO> AllNoticeList();	 //전체 공지 목록
	
	public List<NoticeDTO> selectAllNotice(Criteria cri);	// 전체 공지 목록 페이징
	
	public int totalCount(Criteria cri);	// 전체 게시물 수
	
	public void updateReplyCnt(@Param("nno") int nno,		//두 개 이상 보낼때는 param을 붙여야 한다.
			  				   @Param("num") int num);		//댓글 수정
	
	

	
	
}
