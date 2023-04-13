// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 10:30

package com.reserve.seat.notice;


import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class NoticeDTO {
	
	private int nno;			//공지 번호
	
	@NotBlank(message = "제목을 입력해주세요")
	private String ntitle;		//공지 제목
	
	@NotBlank(message = "내용을 입력해주세요")
	private String ncontent;	//공지 내용
	private String nwriter;		//작성자
	private String regDate;		//공지 등록일
	private String modDate;		//공지 수정일
	
	
}
