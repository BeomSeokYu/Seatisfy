package com.reserve.seat.user;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("user/")
public class UserController {
	
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("/login")
	public String loginForm(Model model) {
		return "login";
	}
	
	@GetMapping("/join")
	public String joinForm(@ModelAttribute("user") User user) {
		return "users/joinform";
	}
	
	@PostMapping("/join")
	public String joinUser(@Validated @ModelAttribute("user") User user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if (bindingResult.hasErrors()) {
			log.info("errors={}", bindingResult);
			// 에러를 List로 저장
			List<ObjectError> list = bindingResult.getAllErrors();
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "users/joinform";
		}
		
		//회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
		String encodedPassword = bcryptPasswordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		//성공 로직
		userService.signup(user);
		userService.changeTmpPw(user);	//임시 비밀번호로 DB데이터 변경, 메일 전송
		
		return "redirect:/user/login";
	}
	
	@GetMapping("/changepw")
	public String changepw(Model model) {
		return "users/pwfind";
	}
	

	

	
}
