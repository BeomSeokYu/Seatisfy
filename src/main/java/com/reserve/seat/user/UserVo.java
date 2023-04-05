package com.reserve.seat.user;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVo {
	
	private int uno;

	private String username;
	
	private String password;
	
	private String name;
	
	private String phone;
	
	private String authority;
	
	private String udate;
	

}
