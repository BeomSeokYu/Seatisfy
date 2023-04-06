/**
 * 작성자 : 유범석
 * 작성일 : 2023-04-05
 */

package com.reserve.seat.reserve.domain;

import java.util.Date;

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
	private String startdate;
	private String enddate;
	private Date regdate;
	private String moddate;
}
