package com.reserve.seat.user;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoogleMailServiceImpl implements MailService {

	private final JavaMailSender mailSender;
	
	@Async
	public void sendMailForPw(String to, String tempPw) {
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("jisukim.fb@gmail.com", "B조 인증센터(보내는 계정 이름)");
			messageHelper.setSubject("[B조 인증센터] 임시 비밀번호입니다.");
			messageHelper.setTo(to);
			messageHelper.setText("임시 비밀번호는 [ " + tempPw + " ] 입니다." );
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
