package com.reserve.seat.seat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeatDTO {
	private Integer sno;
	private Integer pno;
	private boolean isreserved;
}