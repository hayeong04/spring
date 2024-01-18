package com.kh.ex02ha.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.ex02ha.domain.hayeongDomain.BoardVO;
import com.kh.ex02ha.mapper.BoardMapperTests;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMappr;
	
	
	@Test
	public void testInsert() {
		BoardVO boardVO = BoardVO.builder()
				.title("제목-501")
				.content("내용-501")
				.writer("작성자-501")
				.build();
		boardMappr.insert(boardVO);
		
	}
	
	@Test
	public void testRead() {
		Long bno = 2L;
		BoardVO boardVO = boardMappr.read(bno);
	}
	
}
