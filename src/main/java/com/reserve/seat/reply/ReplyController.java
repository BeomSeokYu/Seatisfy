package com.reserve.seat.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글 등록
	@PostMapping(value = "register", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addReply(@RequestBody ReplyDTO reply) {
		
		return replyService.insertReply(reply) == true ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 조회
	
	//댓글 수정
	@PostMapping("/edit")
	@ResponseBody
	public String editReply(ReplyDTO reply) {
	    replyService.updateReply(reply);
	    
	    return "success";
	}
	
	//댓글 삭제
//	@PostMapping("/remove")
//	public String removeReply(int rno) {
//		
//		replyService.deleteReply(rno);
//		
//		return "redirect:/notice/detail?nno=" + reply.getNno();
//	}
}
