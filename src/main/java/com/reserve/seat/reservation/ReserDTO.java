package com.reserve.seat.reservation;

import com.reserve.seat.reservation.ReserDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public class ReserDTO {
		private Integer rno;
		private Integer pno;
		private Integer sno;
		private Integer uno;
		private String rdate;
	}
