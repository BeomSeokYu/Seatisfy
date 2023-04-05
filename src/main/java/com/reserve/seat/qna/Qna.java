package com.reserve.seat.qna;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Qna {
	private int qno;
	private String qtitle;
	private String qcontent;
	private String qdate;
	
	public Qna(int qno, String qtitle, String qcontent, String qdate) {
		this.qno = qno;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qdate = qdate;
		
	}
	public Qna() {
		
	}
	
}
