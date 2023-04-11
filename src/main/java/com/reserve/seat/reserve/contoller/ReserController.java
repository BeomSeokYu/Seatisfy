

package com.reserve.seat.reserve.contoller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reserve.seat.Criteria;
import com.reserve.seat.reserve.domain.PostDTO;
import com.reserve.seat.reserve.domain.ReserDTO;
import com.reserve.seat.reserve.service.ReserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reserve")
@RequiredArgsConstructor
public class ReserController {
	private final ReserService reserService;
	
	@GetMapping
	public String reserList(Model model, @ModelAttribute Criteria criteria) {
//		List<PostDTO> list = reserService.getListAll(criteria != null ? criteria : new Criteria());
//		model.addAttribute("list", list);
//		int totalCount = reserMapper.totalCount(criteria);
//		model.addAttribute("pageDTO", new PageDTO(criteria, totalCount));
		return "reserve/reserList";
	}
	
	@GetMapping("/add")
	public String addView(@ModelAttribute PostDTO postDTO) {
		return "reserve/postForm";
	}
	
	@PostMapping("/add")
	public String addForm(@Validated @ModelAttribute PostDTO postDTO, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
	        return "/reserve/postForm";
	    }
		reserService.addPost(postDTO);
		reserService.addSeat(postDTO.getSeatinfo(), postDTO.getPno());
		return "redirect:/reserve";
	}
	
	@GetMapping("/detail/{pno}")
	public String detailView(@ModelAttribute ReserDTO reserDTO, Model model, @PathVariable int pno) {
		model.addAttribute("post", reserService.getPost(pno));
		model.addAttribute("seats", reserService.getSeatsByPost(pno));
		model.addAttribute("seatinfo", reserService.getPost(pno).getSeatinfo());
		
		return "reserve/postDetail";
	}
	
	
	@PostMapping("/detail/{pno}")
	public String reserve(@Validated @ModelAttribute ReserDTO reserDTO, 
			@PathVariable int pno, 
			RedirectAttributes redirectAttributes) {
		log.info("{}", reserService.reserveSeat(reserDTO, null));
		redirectAttributes.addAttribute(reserService.getSeatsByPost(pno));
		redirectAttributes.addAttribute("seatinfo", reserService.getPost(pno).getSeatinfo());
		return "redirect: /reserve/detail/{pno}";
	}
	
	@ResponseBody
	@PostMapping
	public List<PostDTO> reserListAPI(@ModelAttribute Criteria criteria) {
		return reserService.getPostList(criteria);
	}
	
	@ResponseBody
	@PostMapping("/total")
	public int reserListtotalCountAPI(@ModelAttribute Criteria criteria) {
		return reserService.getPostTotalCount(criteria);
	}
	
	
	
	
	
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
		
//		seatService.addSeat(new SeatDTO(null, 3, true));
//		log.info("{}", seatService.getSeat(2).getPno());
//		seatService.editSeat(new SeatDTO(2, 10, false));
//		seatService.removeSeat(2);
		
		
		log.info("{}", "end");
	}
	
}
