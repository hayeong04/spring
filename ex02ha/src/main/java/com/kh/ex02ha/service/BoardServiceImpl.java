package com.kh.ex02ha.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ex02ha.domain.hayeongDomain.BoardVO;
import com.kh.ex02ha.domain.hayeongDomain.Criteria;
import com.kh.ex02ha.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{

	@Autowired
	private final BoardMapper boardMapper;
	
	@Override
	public Map<String, Object> getList(Criteria cir) {
		List<BoardVO> list = boardMapper.getList();
		int total = boardMapper.getTotal(cir);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		return map;
		
		
	}

	@Override
	public Long register(BoardVO boardVO) {
		Long bno = boardMapper.selectNextval();
		boardVO.setBno(bno);
		boardMapper.insert(boardVO);
		
		return bno;
	}

	@Override
	public BoardVO get(Long bno) {
		
		return boardMapper.read(bno);
	}

	@Override
	public boolean delete(Long bno) {
		int count = boardMapper.delete(bno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean modify(BoardVO boardVO) {
		int count = boardMapper.update(boardVO);
		if(count == 1) {
			return true;
		}
		return false;
	}

}
