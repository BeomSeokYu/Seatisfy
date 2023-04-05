// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 11:26
package com.reserve.seat.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	
	//공지 등록
	public void insertNotice(NoticeDTO notice) {
		noticeRepository.insertNotice(notice);
	}

	//공지 목록
	public List<NoticeDTO> AllNoticeList() {
		return noticeRepository.AllNoticeList();
	}

	//공지 상세보기
	public NoticeDTO detailNotice(String nno) {
		return noticeRepository.detailNotice(nno);
	}
	
	//공지 수정
	public void updateNotice(NoticeDTO notice) {
		noticeRepository.updateNotice(notice);
	}

	//공지 삭제
	public void deleteNotice(String nno) {
		noticeRepository.deleteNotice(nno);
	}
	
	
	
}
