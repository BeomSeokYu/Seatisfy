package com.reserve.seat.reply;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int totalReply;
	private List<ReplyDTO> list;
	
	
	
}
