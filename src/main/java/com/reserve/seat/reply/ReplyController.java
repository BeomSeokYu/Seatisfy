package com.reserve.seat.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.reserve.seat.notice.Criteria;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyDTO reply) {
        int insertCount = replyService.insertReply(reply);

        return insertCount == 1 ? new ResponseEntity<> ("success", HttpStatus.OK) 
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
	
	// 댓글 수정 
    // PUT :자원 전체 수정, 자원 내 모든 필드를 전달해야 함, 일부만 전달할 경우 전달되지 않은 필드는 모두 초기화 처리가 된다.
    // PATCH : 자원 일부 수정, 수정할 필드만 전송
    // @RequestMapping을 사용하는 이유는 여러개의 메소드를 받기 위해.
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value = "/{rno}",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody ReplyDTO reply, @PathVariable("rno") String rno){
        reply.setRno(Integer.parseInt(rno));
        return replyService.updateReply(reply) == 1 
                    ? new ResponseEntity<String> ("success", HttpStatus.OK)
                            : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
	
	//댓글 삭제
	@DeleteMapping(value="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") String rno) {
		return replyService.deleteReply(rno) == 1 
					? new ResponseEntity<String>("success", HttpStatus.OK)
							: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	 // 댓글 조회 
    @GetMapping(value="/select/{rno}", produces = {MediaType.APPLICATION_XML_VALUE,
    		MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
    })
    public ResponseEntity<ReplyDTO> get(@PathVariable("rno") String rno) {
        return new ResponseEntity<>(replyService.selectReply(rno), HttpStatus.OK);
    }
	
	//댓글 전체 목록
	@GetMapping(value="/{nno}", produces = {MediaType.APPLICATION_XML_VALUE,
            MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"
    })
	    public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("nno") String nno) {
	        return new ResponseEntity<>(replyService.replyList(nno), HttpStatus.OK);
	    }
	
	
}
