package com.reserve.seat;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
}
