// 작성자 : 권두현
// 작성일시 : 2023. 4. 5. 11:26
package com.reserve.seat.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.seat.Criteria;
import com.reserve.seat.mapper.NoticeMapper;
import com.reserve.seat.reply.ReplyDTO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;
	
	//공지 등록
	public void insertNotice(NoticeDTO notice) {
		noticeMapper.insertNotice(notice);
	}
	
	//공지 수정
	public void updateNotice(NoticeDTO notice) {
		noticeMapper.updateNotice(notice);
	}

	//공지 삭제
	public void deleteNotice(String nno) {
		noticeMapper.deleteNotice(nno);
	}
	
	//공지 상세보기
	public NoticeDTO detailNotice(String nno) {
		return noticeMapper.detailNotice(nno);
	}		

	//공지 목록
	public List<NoticeDTO> AllNoticeList() {
		return noticeMapper.AllNoticeList();
	}
	
	//공지 페이징 목록
	public List<NoticeDTO> selectAllNotice(Criteria cri){
		return noticeMapper.selectAllNotice(cri);
	}
	
	//전체 공지 수 
	public int totalCount(Criteria cri) {
		return noticeMapper.totalCount(cri);
	}
	
	//댓글 등록
	public void insertReply(Map map) {
		noticeMapper.insertReply(map);
	}
	
	//댓글 수정
	public void updateReply(Map map) {
		noticeMapper.updateReply(map);
	}
	
	//댓글 삭제
	public void deleteReply(int rno) {
		noticeMapper.deleteReply(rno);;
	}

	//특정 댓글 하나 조회
	public ReplyDTO selectReply(String rno) {
		return noticeMapper.selectReply(rno);
	}
	
	//전체 댓글 조회
	public List<ReplyDTO> AllReplyList(String nno){
		return noticeMapper.AllReplyList(nno);
	}
	
	//댓글 증가
	public void updateHit(String nno) {
		noticeMapper.updateHit(nno);
	}
	
	
}
