package com.reserve.seat.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.seat.mapper.NoticeMapper;
import com.reserve.seat.mapper.ReplyMapper;
import com.reserve.seat.notice.Criteria;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private NoticeMapper noticeMapper; 
	
	@Override
	//댓글 등록 
	public int insertReply(ReplyDTO reply) {
		return replyMapper.insertReply(reply);
	}

	@Override
	//댓글 수정
	public int updateReply(ReplyDTO reply) {
		return replyMapper.updateReply(reply);
	}

	@Override
	//댓글 삭제
	public int deleteReply(int rno) {
		return replyMapper.deleteReply(rno);
	}

	@Override
	//댓글 조회
	public ReplyDTO selectReply(int rno) {
		return replyMapper.selectReply(rno);
	}

	@Override
	//댓글 페이징 목록
	public List<ReplyDTO> selectReplyAllPaging(Criteria cri) {
		return replyMapper.selectReplyAllPaging(cri);
	}

	@Override
	//댓글 전체 수
	public int totalReply(int pno) {
		return replyMapper.totalReply(pno);
	}

}
