package com.kh.ex02ha.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ex02ha.domain.ReplyVO;
import com.kh.ex02ha.mapper.BoardMapper;
import com.kh.ex02ha.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{

	private ReplyMapper replyMapper;
	
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public int register(ReplyVO replyVO) {
		int count = replyMapper.insert(replyVO);
		boardMapper.updateReplycnt(replyVO.getBno(), 1);
		return count;
	}

	@Override
	public ReplyVO get(Long rno) {
		ReplyVO replyVO = replyMapper.selectByRno(rno);
		return replyVO;
	}

	@Override
	public int modify(ReplyVO replyVO) {
		int count = replyMapper.update(replyVO);
		return count;
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		Long bno = replyMapper.selectBnoByRno(rno);
		int count = replyMapper.delete(rno);
		boardMapper.updateReplycnt(bno, -1);
		
		return count;
	}

	@Override
	public List<ReplyVO> getList(Long bno) {
		List<ReplyVO> list = replyMapper.selectList(bno);
		return list;
	}
	

	
}
