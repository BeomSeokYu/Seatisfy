

package com.reserve.seat.reserve.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.seat.reserve.mapper.ReserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reserve")
@RequiredArgsConstructor
public class ReserController {
	private final ReserMapper reserMapper;
	
	
	@GetMapping
	void reservationList() {
		log.info("{}", "get");
		log.info("{}", reserMapper.selectBoard(1).getPcontent());
	}
	
	@PostMapping
	void recieveForm() {
		log.info("{}", "post");
	}
	
}
