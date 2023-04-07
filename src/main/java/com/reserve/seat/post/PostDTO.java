package com.reserve.seat.post;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostDTO {
	private Integer pno;
	private String pwriter;
	private String ptitle;
	private String pcontent;
	private String location;
	private String seatinfo;
	private String rdate_start;
	private String rdate_end;
	private String regdate;
	private String moddate;
}
