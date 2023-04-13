package com.reserve.seat;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reserve.seat.HomeController;
import com.reserve.seat.user.User;
import com.reserve.seat.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@ResponseBody
	@PostMapping("/uname")
	public User getUserName(@ModelAttribute User user) {
		user.setName(userService.getUserDetail(user.getUsername()).getName());
		return user;
	}
	
	// 로그인 페이지
	@GetMapping("/login")
	public String loginForm(Model model, String error) {
		if(error != null) {
			model.addAttribute("error", "아아디 또는 비밀번호가 맞지 않습니다.");
		}
		return "users/login";
	}
	
	// 회원가입 페이지
	@GetMapping("/join")
	public String joinForm(@ModelAttribute("user") User user) {
		return "users/joinform";
	}
	
	// 회원가입 처리
	@PostMapping("/join")
	public String joinUser(@Validated @ModelAttribute("user") User user, BindingResult bindingResult) {
		if (!user.getPassword().equals(user.getPasswordConfirm())) {
		    bindingResult.rejectValue("passwordConfirm", "pwConfirm", "비밀번호가 일치하지 않습니다.");
		}
		 
		if (bindingResult.hasErrors()) {
//			log.info("errors={}", bindingResult);
			return "users/joinform";
		}
		
		//회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
		String encodedPassword = bcryptPasswordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		//성공 로직
		userService.signup(user);
//		userService.changeTmpPw(user);	//임시 비밀번호로 DB데이터 변경, 메일 전송
		
		return "redirect:/login";
	}
	
	
	// 임시 비밀번호 발급
	@GetMapping("/findpw")
	public String findPw(Model model) {
		return "users/pwfind";
	}
	
	// 아이디 찾기 폼
	@GetMapping("/findid")
	public String findIdForm(@ModelAttribute("user") User user) {
		return "users/idfind";
	}
	// 아이디 찾기
	@PostMapping("/findid")
	public String findId(@ModelAttribute("user") User user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		String IdFound = "";
		if (user.getName().isEmpty() || user.getPhone().isEmpty()) {
		    bindingResult.reject("error", "이름과 전화번호를 모두 입력해주세요.");
		} else if( (IdFound = userService.findId(user)) == null ) {
			bindingResult.reject("error", "해당 회원을 찾을 수 없습니다.");
		}
		 
		if (bindingResult.hasErrors()) {
//			log.info("errors={}", bindingResult);
			return "users/idfind";
		}
		
		// 이메일 일부 *처리
		int atIndex = IdFound.indexOf("@");
	    String maskedId = IdFound.substring(0, 4);
	    for (int i = 4; i < atIndex; i++) {
	    	maskedId += "*";
	    }
	    maskedId += IdFound.substring(atIndex);
	    
		//성공 로직
		redirectAttributes.addFlashAttribute("idFound", maskedId);
		
		return "redirect:/findid";
	}
	
	
}
