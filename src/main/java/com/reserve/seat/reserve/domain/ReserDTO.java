/**
 * 작성자 : 유범석
 * 작성일 : 2023-04-05
 */

package com.reserve.seat.reserve.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserDTO {
	private int rno;
	private int pno;
	private int sno;
	private String rdate;
	
	public ReserDTO() {}
	
	public ReserDTO(int pno, int sno, String rdate) {
		this.pno = pno;
		this.sno = sno;
		this.rdate = rdate;
	}
}
