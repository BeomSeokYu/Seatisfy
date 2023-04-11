package com.reserve.seat.qna;




import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class QnaDTO {
	private int qno;
	
	@NotBlank(message = "제목은 필수다")
	private String qtitle;
	
	@NotBlank(message = "내용도 필수다")
	private String qcontent;
	
	private String qdate;
}
