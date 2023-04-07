package com.reserve.seat.post;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;
@Controller
@RequestMapping("/reserve")
@RequiredArgsConstructor
public class PostController {
	private final PostServiceImpl postService;
	//등록
	@GetMapping("/add")
	public String requestAddPostForm(@ModelAttribute("ppp") PostDTO pt) {
		return "reserve/postadd";
	}
	
	@PostMapping("/add")
	public String submitAddPostForm(@ModelAttribute("ppp") PostDTO pt) {
		postService.insertPost(pt);
            return "redirect:/reserve/add";
        }
		
}
