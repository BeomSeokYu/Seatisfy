package com.reserve.seat.qna;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {
	private int qno;
	private String qtitle;
	private String qcontent;
	private String qdate;
}
