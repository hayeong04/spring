package com.kh.ex02ha.service;

import java.util.Map;

import com.kh.ex02ha.domain.BoardVO;
import com.kh.ex02ha.domain.Criteria;

public interface BoardService {

	//글 목록가져오기
	public Map<String, Object> getList(Criteria cri);
	
	//글 등록하기
	public Long register(BoardVO boardVO);
	
	//글 하나 가져오기
	public BoardVO get(Long bno);
	
	//글 삭제하기
	public boolean delete(Long bno);
	
	//글 수정하기
	public boolean modify(BoardVO boardVO);
}
