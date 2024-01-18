package com.kh.ex02ha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.ex02ha.domain.hayeongDomain.BoardVO;
import com.kh.ex02ha.domain.hayeongDomain.Criteria;

public interface BoardMapper {

	public int getTotal(Criteria cri);
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO boardVO);
	
	public Long insertSelectKey(BoardVO boardVO);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	 
	public int update(BoardVO boardVO);
	
	public Long selectNextval();
	
	public void updateReplycnt(@Param("bno") long bno,
							@Param("amount") int amount);
}
