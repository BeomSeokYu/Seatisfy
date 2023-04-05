// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:37
package com.reserve.seat.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	//공지 등록
	@GetMapping("/add")
	public String requestAddNoticeForm(@ModelAttribute("NewNotice") NoticeDTO notice) {

		return "notice/noticeAdd";
	}

	//공지 등록
	@PostMapping("/add")
	public String submitAddNoticeForm(@ModelAttribute("NewNotice") NoticeDTO notice) {
		noticeService.insertNotice(notice);
		return "redirect:/notice/list";
	}

	//공지 전체 목록
	@GetMapping("/list")
	public String NoticeList(Model model) {
		List<NoticeDTO> noticeList = noticeService.AllNoticeList();
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeAllList";
	}

	//공지 상세 보기
	@GetMapping("/detail")
	public String requestNoticeByNum(@RequestParam("nno") String nno, Model model) {
		
		NoticeDTO noticeNum = noticeService.detailNotice(nno);
		model.addAttribute("notice", noticeNum);

		return "notice/noticeDetail";
	}
	
	//공지 수정
	
	
	//공지 삭제
	
}
