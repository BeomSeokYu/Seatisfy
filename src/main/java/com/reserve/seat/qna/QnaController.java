package com.reserve.seat.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qnas")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qnaadd")
	public String requestAddQnaForm(@ModelAttribute("NewQna") Qna qna) {
		return "qnas/qnaadd";
	}
	
	@PostMapping("/qnaadd")
	public String submitAddQnaForm(@ModelAttribute("NewQna") Qna qna) {
		qnaService.insertQna(qna);
		return "redirect:/qnas/qnaadd";
	}
	
	@GetMapping("/list")
	public String QnaList(Model model) {
		List<Qna> qnaList = qnaService.QnaAllList();
		model.addAttribute("qnaList", qnaList);

		return "qnas/qnaAllList";
	}
	
}
