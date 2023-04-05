package com.reserve.seat.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {

	private final UserService userService;
	

//	@Autowired
//	BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("/login")
	public String loginForm(Model model) {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("loginUser") UserVo uvo, HttpServletRequest request) {
		String loginUsername = request.getParameter("username");
		String loginPassword = request.getParameter("password");
		
		UserVo loginUser = userService.selectUser(loginUsername);
		if(loginUser == null) {
			log.info("해당 회원 없음.");
			return "/join";
		} else if(!loginPassword.equals(loginUser.getPassword())) {
			log.info("비밀번호 틀림");
			return "/login";
		} else {
			log.info("로그인 성공");
			return "/";
		}
		
	}
	
	@GetMapping("/join")
	public String joinForm(Model model) {
		model.addAttribute("user", new UserVo());
		return "users/joinform";
	}
	
	@PostMapping("/join")
	public String joinUser(@ModelAttribute UserVo uvo) {
		boolean result = userService.signup(uvo);
		if(result) {
			log.info("userService.insert(uvo) true");
		} else {
			log.info("회원가입 실패");
		}
		return "redirect:/login";
	}

	

	
}
