package com.kh.ex02ha.mapper;

import java.util.List;

import com.kh.ex02ha.domain.hayeongDomain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO replyVO);
	
	public ReplyVO selectByRno(Long rno);
	
	public int update(ReplyVO replyVO);
	
	public int delete(Long rno);
	
	public List<ReplyVO> selectList(Long rno);
	
	public Long selectBnoByRno(Long rno);
}
