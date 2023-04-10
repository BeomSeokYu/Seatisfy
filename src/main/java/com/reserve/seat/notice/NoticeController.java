// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:37
package com.reserve.seat.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reserve.seat.reply.ReplyDTO;
import com.reserve.seat.reply.ReplyService;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ReplyService replyService;

	//공지 등록 조회 폼
	@GetMapping("/add")
	public String requestAddNoticeForm(@ModelAttribute("notice") NoticeDTO notice) {
		//url에 /notice/add로 입력 시 notice/noticeAdd.jsp로 이동
		return "notice/noticeAdd";
	}

	//공지 등록
	@PostMapping("/add")
	public String submitAddNoticeForm(@ModelAttribute("notice") NoticeDTO notice) {
		
		//공지를 notice 테이블에 등록하고
		noticeService.insertNotice(notice);
		
		return "redirect:/notice/list";	 //공지 전체 목록으로 response.sendRedirect()처리
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
		
		//댓글 조회
		List<ReplyDTO> replyList = replyService.AllReplyList(nno); 
		int cnt = replyList.size();	// 댓글 수
		model.addAttribute("replyList", replyList);
		model.addAttribute("cnt", cnt);
		
		
		

		return "notice/noticeDetail";
	}
	
	//공지 수정 폼
	@GetMapping("/update")
	public String updateNoticeForm(@ModelAttribute("updateNotice") NoticeDTO notice, 
								   @RequestParam("nno") String nno, Model model) {
		
		NoticeDTO noticeNum = noticeService.detailNotice(nno);
		model.addAttribute("notice", noticeNum);
		
		return "notice/noticeUpdate";
	}
	
	//공지 수정
	@PostMapping("/update")
	public String updateNotice(NoticeDTO notice) {
		
		noticeService.updateNotice(notice);
		return "redirect:/notice/list";
	}
	
	
	//공지 삭제
	@PostMapping("/remove")
	public String removeNotice(@RequestParam("nno") String nno) {
		
		noticeService.deleteNotice(nno);
		
		return "redirect:/notice/list";
	}
	
	//페이지 수
	@PostMapping("/total")
	@ResponseBody
	public int NoticeList(Criteria cri) {

		int totalcount = noticeService.totalCount(cri);
		
		return totalcount;
		
	}
	
	//공지 전체 목록
	@PostMapping("/list")
	@ResponseBody
	public List<NoticeDTO> NoticeListCount(Criteria cri) {

		return noticeService.selectAllNotice(cri);
	}
	
	
}
