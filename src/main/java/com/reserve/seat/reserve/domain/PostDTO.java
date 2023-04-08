/**
 * 작성자 : 유범석
 * 작성일 : 2023-04-05
 */

package com.reserve.seat.reserve.domain;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import com.reserve.seat.reserve.validator.DateTimeLocal;
import com.reserve.seat.reserve.validator.SeatInfo;

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
	
	@NotBlank
	private String ptitle;
	@NotBlank
	private String pcontent;
	@NotBlank
	private String place;
	@NotBlank
	private String address;
	
	@SeatInfo
	private String seatinfo;
	
	@DateTimeLocal
	private String startdate;
	
	@DateTimeLocal
	private String enddate;
	private String regdate;
	private String moddate;
}
