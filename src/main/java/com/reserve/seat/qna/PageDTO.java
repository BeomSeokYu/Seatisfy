package com.reserve.seat.qna;

import com.reserve.seat.Criteria;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private final double NUM_PER_PAGE = 5.0;	//한 페이지에 표시할 페이지 번호 수
	private int start;							//시작 페이지 번호
	private int end;							//끝 페이지 번호
	private boolean previous;					//이전 
	private boolean next;						//다음
	private Criteria cri;
	
	public PageDTO(Criteria cri, int totalCount) {
		this.cri = cri;
		
		int pages = (int)(Math.ceil((double)totalCount/cri.getAmount())); //전체 페이지 번호 수
		end = (int)(Math.ceil(cri.getPageNum() / NUM_PER_PAGE) * NUM_PER_PAGE);
		start = end - (int)(NUM_PER_PAGE - 1);
		end = end >= pages ? pages : end; 	//실제 끝 페이지 번호 확인
				
		previous = start > 1;
		next = end < pages; 
	}						
}











