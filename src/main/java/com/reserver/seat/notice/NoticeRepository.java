package com.reserver.seat.notice;

import java.util.List;


public interface NoticeRepository {

	
	void setNewNotice(NoticeDTO notice);
	
	List<NoticeDTO> getAllNoticeList();
	
	NoticeDTO getNoticeById(String bid);
	

	
	
}
