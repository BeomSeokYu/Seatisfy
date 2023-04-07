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
	
	@Override
	//댓글 등록 
	public void insertReply(ReplyDTO reply) {
		replyMapper.insertReply(reply);
	}

	@Override
	//댓글 수정
	public void updateReply(ReplyDTO reply) {
		replyMapper.updateReply(reply);
	}

	@Override
	//댓글 삭제
	public void deleteReply(ReplyDTO reply) {
		replyMapper.deleteReply(reply);
	}

	@Override
	//댓글 조회
	public List<ReplyDTO> selectReplyList(String nno) {
		return replyMapper.selectReplyList(nno);
	}

	@Override
	//댓글 페이징 목록
	public List<ReplyDTO> selectReplyAllPaging(Criteria cri) {
		return replyMapper.selectReplyAllPaging(cri);
	}

	@Override
	//댓글 전체 수
	public int totalReply(int nno) {
		return replyMapper.totalReply(nno);
	}

}
