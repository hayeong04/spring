package com.kh.ex02ha.service;

import java.util.List;

import com.kh.ex02ha.domain.hayeongDomain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO replyVO);
	
	public ReplyVO get (Long rno);
	
	public int modify(ReplyVO replyVO);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Long bno);
}
