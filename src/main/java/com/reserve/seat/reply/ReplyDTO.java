package com.reserve.seat.reply;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReplyDTO {

	private int rno;			//댓글번호
	private int nno;
	private int pno;			//예약 번호
	private String rwriter;		//작성자
	private String rcontent;	//댓글 내용
	private String regDate;		//등록일자
	private String modDate;	//수정일자
}
