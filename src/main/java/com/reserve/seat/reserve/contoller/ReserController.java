

package com.reserve.seat.reserve.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.seat.Criteria;
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
	
	@GetMapping("test")
	public void reserTest() {
		log.info("{}", "get start");
//		log.info("{}", reserMapper.selectPost(1).getPcontent());
//		reserMapper.insertPost(new PostDTO(null, "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", null, "asdf"));
//		reserMapper.updatePost(new PostDTO(2, "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", "zxcv", null));
//		reserMapper.deletePost(2);
		log.info("{}", reserMapper.selectAllPost(new Criteria()));
		log.info("{}", "end");
	}
	
	@GetMapping
	public String reserList(Model model, @ModelAttribute Criteria criteria) {
		model.addAttribute("list", reserMapper.selectAllPost(criteria != null? criteria : new Criteria()));
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
		return reserMapper.selectAllPost(criteria);
	}
	
	@ResponseBody
	@PostMapping("/total")
	public int totalCountAPI(@ModelAttribute Criteria criteria) {
		return reserMapper.totalCount(criteria);
	}
	
	
}
