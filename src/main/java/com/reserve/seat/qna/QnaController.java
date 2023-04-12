package com.reserve.seat.qna;

import java.security.Principal;
import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.seat.Criteria;
import com.reserve.seat.user.User;
import com.reserve.seat.user.UserService;

import lombok.RequiredArgsConstructor;
@Controller
@RequestMapping("/qnas")
@RequiredArgsConstructor
public class QnaController {
	private final QnaServiceImpl qnaService;
	//등록
	@GetMapping("/add")
	public String requestAddQnaForm(@ModelAttribute("eee") QnaDTO qna) {
		return "qnas/qnaadd";
	}
	
	@PostMapping("/add")
	public String submitAddQnaForm(@Validated @ModelAttribute("eee")  QnaDTO qna, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
            // 검사에 실패한 항목이 있다면 처리
            return "qnas/qnaadd";
        } else {
        	qnaService.insertQna(qna);
            // 검사에 성공한 경우 처리
            return "redirect:/qnas/list";
        }
	}
	//목록
	@GetMapping("/list")
	public String qnaList(Model model,@ModelAttribute Criteria cri) {
//		List<QnaDTO> qnaList = qnaService.qnaList();
//		model.addAttribute("qnaList", qnaList);
		model.addAttribute("list", qnaService.qnaAllList(cri));
		
		int totalCount = qnaService.totalCount(cri);
		return "qnas/qnaList";
	}
	@PostMapping("/list")
	@ResponseBody
	public List<QnaDTO> qnaListCount(Criteria cri) {

		return qnaService.qnaAllList(cri);
	}
	@PostMapping("/total")
	@ResponseBody
	public int QnaList(Criteria cri) {

		int totalcount = qnaService.totalCount(cri);
		
		return totalcount;
	}
	
	//수정
	@GetMapping("/update")
	public String updateQnaForm(@ModelAttribute QnaDTO NewQna,@RequestParam("qno") String qno, Model model) {
		QnaDTO qnaNum = qnaService.selectQna(qno);
		model.addAttribute("qna", qnaNum);
		
		return "qnas/qnaUpdate";
	}
	@PostMapping("/update")
	public String updateQna(QnaDTO qna) {
		
		qnaService.updateQna(qna);
		return "redirect:/qnas/list";
	}
	//삭제
	@PostMapping("/delete")
	public String deleteQna(@RequestParam("qno") String qno) {
		
		qnaService.deleteQna(qno);
		
		return "redirect:/qnas/list";
	}
	//상세보기
	@GetMapping("/select")
	public String requestQnaByNum(@RequestParam("qno") String qno, Model model) {
		
		QnaDTO qnaNum = qnaService.selectQna(qno);
		model.addAttribute("qna", qnaNum);

		return "qnas/selectQna";
	}
	
}
