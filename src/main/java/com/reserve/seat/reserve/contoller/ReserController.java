

package com.reserve.seat.reserve.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.mapper.ReserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reserve")

public class ReserController {
	
	@Autowired
	private ReserMapper reserMapper;
	
	@GetMapping
	void reservationList() {
		log.info("{}", "get");
		log.info("{}", reserMapper.selectPost(1000).getPcontent());
	
		reserMapper.insertPost(new PostDTO("asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf"));
		
		log.info("{}", "end");
	}
	
	@PostMapping
	void recieveForm() {
		log.info("{}", "post");
	}
	
}
