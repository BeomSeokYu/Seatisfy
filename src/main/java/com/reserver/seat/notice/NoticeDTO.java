package com.reserver.seat.notice;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeDTO {
	
	private int nno;			//공지 번호
	private String ntitle;		//공지 제목
	private String ncontent;	//공지 내용
	private String ndate;		//공지 등록일
	
	public NoticeDTO(String ntitle, String ncontent, String ndate) {
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
	}

	public NoticeDTO() { }
	
}
