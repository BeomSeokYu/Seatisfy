// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:30

package com.reserve.seat.notice;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeDTO {
	
	private int nno;			//공지 번호
	private String ntitle;		//공지 제목
	private String ncontent;	//공지 내용
	private String ndate;		//공지 등록일
	private String nwriter;		//작성자
	
	public NoticeDTO(int nno, String ntitle, String ncontent, String ndate, String nwriter) {
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.nwriter = nwriter;
	}

	public NoticeDTO() { }
	
}
