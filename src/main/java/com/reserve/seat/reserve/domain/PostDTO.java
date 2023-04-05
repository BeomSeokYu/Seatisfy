/**
 * 작성자 : 유범석
 * 작성일 : 2023-04-05
 */

package com.reserve.seat.reserve.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostDTO {
	private int pno;
	private String pwiter;
	private String pcontent;
	private String location;
	private String seatinfo;
	private String rdate_start;
	private String rdate_end;
	private String pdate_upload;
	private String pdate_update;
	
	public PostDTO(){}
	
	public PostDTO(String pwiter, String pcontent, String location, String seatinfo, String rdate_start,
			String rdate_end, String pdate_upload, String pdate_update) {
		this.pwiter = pwiter;
		this.pcontent = pcontent;
		this.location = location;
		this.seatinfo = seatinfo;
		this.rdate_start = rdate_start;
		this.rdate_end = rdate_end;
		this.pdate_upload = pdate_upload;
		this.pdate_update = pdate_update;
	}
}
