/**
 * 작성자 : 유범석
 * 작성일 : 2023-04-05
 */

package com.reserve.seat.reserve.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SeatDTO {
	private int sno;
	private int pno;
	private int isreserved;
	
	public SeatDTO() {}
	
	public SeatDTO(int pno, int isreserved) {
		this.pno = pno;
		this.isreserved = isreserved;
	}
}
