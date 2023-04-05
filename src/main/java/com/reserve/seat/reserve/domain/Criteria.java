package com.reserve.seat.reserve.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int amount;			// 한 페이지에 출력할 게시물의 수
	private int pageNum;		// 페이지 번호
	private String type;		// 검색 타입
	private String keyword;		// 검색어
	
	public Criteria() {		// 값을 지정하지 않은 경우 기본값
		this(5, 1);			// 한 페이지에 게시물 5개, 페이지 번호는 1
	}
	public Criteria(int amount, int pageNum) {
		super();
		this.amount = amount;
		this.pageNum = pageNum;
	}
	
	public String[] getTypeArr() {
		//객체 타입의 T,C,W를 배열로 반환
		return type == null ? new String[] {} : type.split("");
	}
}