package com.reserve.seat.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글 등록
	@PostMapping("/write")
	public String addReply(ReplyDTO reply) {
		
		replyService.insertReply(reply);
		
		return "redirect:/notice/detail?nno=" + reply.getNno();
		
		
	}
	
	//댓글 조회
	
	//댓글 수정
	
	//댓글 삭제
	@PostMapping("/remove")
	public String removeReply(@RequestParam("rno") String rno) {
		
		replyService.deleteReply(rno);
		
		return "redirect:/notice/list";
	}
}
