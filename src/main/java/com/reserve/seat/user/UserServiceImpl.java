package com.reserve.seat.user;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	
	private final UserMapper userMapper;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final MailService mailService;
	
	@Override
	public void signup(User user) {
		userMapper.insertUser(user);		
	}

	@Override
	public boolean changeTmpPw(User user) {
      
		String tempPw = generateTempPassword();
      
		String encodedTmpPw = bcryptPasswordEncoder.encode(tempPw);
		user.setPassword(encodedTmpPw);
      
		boolean result = (userMapper.updatePassword(user) != 0) ? true : false;
		if (result) {
			mailService.sendMail(user.getUsername(), "[Seatisfy] 임시 비밀번호입니다.", "임시 비밀번호는 [ " + tempPw + " ] 입니다.");
		}
		return result;
	}
   
	// 랜덤한 임시 비밀번호 생성하는 메소드
	public static String generateTempPassword() {
		SecureRandom random = new SecureRandom();
		byte[] bytes = new byte[10];
		random.nextBytes(bytes);
		return Base64.getEncoder().encodeToString(bytes);
	}
	
	// 비밀번호 변경
	@Override
	public boolean changePw(User user) {
		return (userMapper.updatePassword(user) != 0) ? true : false;
	}

	@Override
	public List<User> getAllUser(Criteria cri) {
		return userMapper.listUser(cri);
	}

	@Override
	public boolean changeAutority(User user) {
		return (userMapper.updateAuthority(user) != 0) ? true : false;
	}

	@Override
	public boolean removeUser(int uno) {
		return (userMapper.deleteUser(uno) != 0) ? true : false;
	}

	@Override
	public User getUserDetail(String username) {
		return userMapper.findById(username);
	}

	@Override
	public boolean editUser(User user) {
		return (userMapper.updateUser(user) != 0) ? true : false;
	}

	@Override
	public int totalCount(Criteria cri) {
		return userMapper.totalCount(cri);
	}

	@Override
	public String findId(User user) {
		return userMapper.findIdByName(user);
	}


}
