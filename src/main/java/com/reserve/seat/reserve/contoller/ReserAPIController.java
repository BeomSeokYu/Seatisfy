package com.reserve.seat.reserve.contoller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.reserve.seat.Criteria;
import com.reserve.seat.reply.ReplyDTO;
import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.domain.ReserDTO;
import com.reserve.seat.reserve.service.ReserService;
import com.reserve.seat.user.User;
import com.reserve.seat.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/reser")
@RequiredArgsConstructor
public class ReserAPIController {
	private final ReserService reserService;
	private final UserService userService;
	
	@PostMapping("/isReserve")
	public boolean isReserve(@RequestParam int pno) {
		PostDTO post = reserService.getPost(pno);
		LocalDateTime nowTime = LocalDateTime.now();
		LocalDateTime startDate = LocalDateTime.parse(post.getStartdate());
		LocalDateTime endDate = LocalDateTime.parse(post.getEnddate());
		if (!nowTime.isAfter(startDate)) {
			return false;
		}
		if (!nowTime.isBefore(endDate)){
			return false;
		}
		
		return true;				
	}
	
	@PostMapping("/post")
	public List<PostDTO> postListAPI(@ModelAttribute Criteria criteria) {
		return reserService.getPostList(criteria);
	}
	
	@PostMapping("/post/total")
	public int postListtotalCountAPI(@ModelAttribute Criteria criteria) {
		return reserService.getPostTotalCount(criteria);
	}
	
	@PostMapping("/mypost")
	public List<PostDTO> myPostListAPI(@ModelAttribute Criteria criteria, Principal principal) {
		return reserService.getPostListById(
				criteria.getAmount(),
				criteria.getOffset(),
				criteria.getTypeArr(),
				criteria.getKeyword(),
				principal.getName());
	}
	
	@PostMapping("/mypost/total")
	public int myPostListtotalCountAPI(@ModelAttribute Criteria criteria) {
		return reserService.getPostTotalCount(criteria);
	}
	
	@PostMapping("/myreser")
	public List<PostDTO> myReserListAPI(@ModelAttribute Criteria criteria, Principal principal) {
		List<ReserDTO> reserList = reserService.getMyReserList(criteria.getAmount(), criteria.getOffset(), principal.getName());
		List<PostDTO> postList = null;
		if(reserList != null) {
			postList = new ArrayList<PostDTO>();
			for (int i = 0; i < reserList.size(); i++) {
				postList.add(reserService.getPost(reserList.get(i).getPno()));
			}
		}
		return postList;
	}
	
	@PostMapping("/myreser/total")
	public int myReserListtotalCountAPI() {
		return reserService.getReserTotalCount();
	}
	
	@PostMapping("/reply")
	public List<ReplyDTO> replyListAPI(int amount, int offset, int pno) {
		return reserService.AllReplyList(amount, offset , pno);
	}
	
	@PostMapping("/reply/total")
	public int replyListtotalCountAPI(int pno) {
		return reserService.getReplyTotalCount(pno);
	}
}
