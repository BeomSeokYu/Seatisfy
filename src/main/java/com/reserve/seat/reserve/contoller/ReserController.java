

package com.reserve.seat.reserve.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.PostMapper;
import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.domain.ReserDTO;
import com.reserve.seat.reserve.domain.SeatDTO;
import com.reserve.seat.reserve.service.PostService;
import com.reserve.seat.reserve.service.ReserService;
import com.reserve.seat.reserve.service.SeatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reserve")
@RequiredArgsConstructor
public class ReserController {
	private final ReserService reserService;
	private final PostService postService;
	private final SeatService seatService;
	
	@GetMapping("test")
	public void reserTest() {
		log.info("{}", "get start");
		
//		log.info("{}", reserMapper.selectPost(1).getPcontent());
//		reserMapper.insertPost(new PostDTO(null, "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", null, "asdf"));
//		reserMapper.updatePost(new PostDTO(2, "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", null));
//		reserMapper.deletePost(2);
//		log.info("{}", reserMapper.selectAllPost(new Criteria()));
//		reserService.addReser(new ReserDTO(null, 1, 1, 1, "2023-01-01"));
//		log.info("{}", reserService.getReser(1).getPno());
//		reserService.editReser(new ReserDTO(1, 2, 1, 1, "2023-01-01"));
//		reserService.removeReser(1);
		
		seatService.addSeat(new SeatDTO(null, 3, true));
//		log.info("{}", reserService.getReser(1).getPno());
//		reserService.editReser(new ReserDTO(1, 2, 1, 1, "2023-01-01"));
//		reserService.removeReser(1);
		
		log.info("{}", "end");
	}
	
	@GetMapping
	public String reserList(Model model, @ModelAttribute Criteria criteria) {
//		List<PostDTO> list = reserService.getListAll(criteria != null ? criteria : new Criteria());
//		model.addAttribute("list", list);
//		int totalCount = reserMapper.totalCount(criteria);
//		model.addAttribute("pageDTO", new PageDTO(criteria, totalCount));
		return "reserve/reserList";
	}
	
	@GetMapping("/new")
	public String formView() {
		log.info("{}", "formView");
		return "reserForm";
	}
	
	@PostMapping("/new")
	public String getForm() {
		log.info("{}", "post");
		return "redirect:/reserve";
	}
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping
	public List<PostDTO> reserListAPI(@ModelAttribute Criteria criteria) {
		return postService.getPostList(criteria);
	}
	
	@ResponseBody
	@PostMapping("/total")
	public int reserListtotalCountAPI(@ModelAttribute Criteria criteria) {
		return postService.getPostTotalCount(criteria);
	}
	
	
}
