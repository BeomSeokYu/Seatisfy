// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 11:26
package com.reserve.seat.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.seat.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;
	
	//공지 등록
	public boolean insertNotice(NoticeDTO notice) {
		return noticeMapper.insertNotice(notice) == 1 ? true : false;
	}
	
	//공지 수정
	public boolean updateNotice(NoticeDTO notice) {
		return noticeMapper.updateNotice(notice) == 1 ? true : false;
	}

	//공지 삭제
	public boolean deleteNotice(int nno) {
		//공지 삭제시 댓글 먼저 삭제
		return noticeMapper.deleteNotice(nno) == 1 ? true : false ;
	}
	
	//공지 상세보기
	public NoticeDTO detailNotice(int nno) {
		return noticeMapper.detailNotice(nno);
	}		

	//공지 목록
	public List<NoticeDTO> AllNoticeList() {
		return noticeMapper.AllNoticeList();
	}
	
	//공지 페이징 목록
	public List<NoticeDTO> selectAllNotice(Criteria cri){
		return noticeMapper.selectAllNotice(cri);
	}
	
	//전체 공지 수 
	public int totalCount(Criteria cri) {
		return noticeMapper.totalCount(cri);
	}
	
}
