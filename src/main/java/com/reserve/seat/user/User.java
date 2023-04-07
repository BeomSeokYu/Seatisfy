package com.reserve.seat.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
	private int uno;

	@Email(message = "이메일 형식이 아닙니다.")
	@NotEmpty(message = "아이디는 필수 입력값입니다.")
	@UniqueUsername
	private String username;
	
	@NotEmpty(message = "비밀번호는 필수 입력값입니다.")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$", message = "비밀번호는 8자 이상이어야 하며, 영문자와 숫자를 모두 포함해야 합니다.")
	private String password;
	
	@NotBlank(message = "이름은 필수 입력값입니다.")
	private String name;
	
	@NotBlank(message = "전화번호는 필수 입력값입니다.")
	@Pattern(regexp = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$", message = "올바른 전화번호 형식이 아닙니다.")
	private String phone;
	
	private String authority;
	
	private String udate;
	
	
	

}
