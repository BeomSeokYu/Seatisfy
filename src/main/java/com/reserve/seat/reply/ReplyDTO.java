package com.reserve.seat.reply;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyDTO {

	private int rno;			//댓글번호
	private int bno;			//게시물번호
	private String reply;		//댓글
	private String replyer;		//작성자
	private String regDate;		//등록일자
	private String updateDate;	//수정일자
}
