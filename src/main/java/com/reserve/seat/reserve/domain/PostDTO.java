/**
 * 작성자 : 유범석
 * 작성일 : 2023-04-05
 */

package com.reserve.seat.reserve.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PostDTO {
	private int pno;
	private String pwriter;
	private String pcontent;
	private String location;
	private String seatinfo;
	private String startdate;
	private String enddate;
	private String regdate;
	private String moddate;

	public PostDTO(String pwriter, String pcontent, String location, String seatinfo, String startdate, String enddate,
			String moddate) {
		super();
		this.pwriter = pwriter;
		this.pcontent = pcontent;
		this.location = location;
		this.seatinfo = seatinfo;
		this.startdate = startdate;
		this.enddate = enddate;
		this.moddate = moddate;
	}

	
}
