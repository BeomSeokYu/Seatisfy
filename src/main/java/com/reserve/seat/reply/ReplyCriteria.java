package com.reserve.seat.reply;

import lombok.AllArgsConstructor;
import lombok.Data;

//Criteria : 검색의 기준
@Data
@AllArgsConstructor
public class ReplyCriteria {
 private int pageNum;
 private int amount;

 //[1] 
 //외부에서 사용자가 선택한 카테고리를 대표하는 문자열을 type으로 전달받는다(페이지에서 제목 또는 내용 선택 시 "TC" 전달됨)
 //사용자가 검색하고 싶은 키워드를 keyword로 전달받는다.
 private String type;
 private String keyword;

 public ReplyCriteria() {
    this(1, 10);
 }

 public ReplyCriteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
 }

 //[2]
 //사용자가 다중 항목을 선택했을 경우 각 항목을 분리해야 하기 때문에,
 //단일 항목들을 문자열 타입으로 리턴해준다.
 //MyBatis에서는 getter를 찾아서 실행하므로, typeArr변수 선언 없이 getter만 선언한다.
 public String[] getTypeArr() {
    return type == null ? new String[] {} : type.split("");
 }

}
