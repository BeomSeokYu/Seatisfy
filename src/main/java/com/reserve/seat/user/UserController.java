package com.reserve.seat.user;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;
//	private final BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("/login")
	public String loginForm(Model model) {
		return "login";
	}
	
//	@PostMapping("/login")
//	public String login(@ModelAttribute("loginUser") User uvo, HttpServletRequest request) {
//		String loginUsername = request.getParameter("username");
//		String loginPassword = request.getParameter("password");
//		
//		User loginUser = userService.selectUser(loginUsername);
//		if(loginUser == null) {
//			log.info("해당 회원 없음.");
//			return "/join";
//		} else if(!loginPassword.equals(loginUser.getPassword())) {
//			log.info("비밀번호 틀림");
//			return "/login";
//		} else {
//			log.info("로그인 성공");
//			return "/";
//		}
//		
//	}
	
	@GetMapping("/join")
	public String joinForm(@ModelAttribute("user") User user) {
		
//		model.addAttribute("user", new User());
		return "users/joinform";
	}
	
	@PostMapping("/join")
	public String joinUser(@ModelAttribute("user") User user) {
		//회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
//		String encodedPassword = bcryptPasswordEncoder.encode(user.getPassword());
//		user.setPassword(encodedPassword);
		
		
		System.out.println(user.getUsername());
		
		userService.signup(user);
		
		System.out.println(user.getClass());
		
		return "redirect:/login";
	}

	

	
}
