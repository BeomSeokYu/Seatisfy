// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 11:26
package com.reserve.seat.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//공지 등록
	@Override
	public void insertNotice(NoticeDTO notice) {
		this.sqlSessionTemplate.insert("notice.insert", notice);
	}

	//공지 목록
	@Override
	public List<NoticeDTO> AllNoticeList() {
		return this.sqlSessionTemplate.selectList("notice.all_notice");
	}

	//공지 상세보기
	@Override
	public NoticeDTO detailNotice(String nno) {
		return this.sqlSessionTemplate.selectOne("notice.detail_notice", nno);
	}
	
	//공지 수정
	@Override
	public void updateNotice(NoticeDTO notice) {
		this.sqlSessionTemplate.update("notice.update_notice", notice);
	}

	//공지 삭제
	@Override
	public void deleteNotice(String nno) {
		this.sqlSessionTemplate.delete("notice.delete_notice", nno);
	}

}
