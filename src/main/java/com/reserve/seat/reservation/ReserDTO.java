package com.reserve.seat.reservation;

import com.reserve.seat.qna.QnaDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public class ReserDTO {
		private int rno;
		private int pno;
		private int sno;
		private int uno;
		private String rdate;
	}
