package com.kh.ex02ha.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ex02ha.domain.BoardVO;
import com.kh.ex02ha.domain.Criteria;
import com.kh.ex02ha.domain.PageDTO;
import com.kh.ex02ha.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		Map<String, Object> map = boardService.getList(cri);
		@SuppressWarnings("unchecked")
		List<BoardVO> list = (List<BoardVO>)map.get("list");
		int total = (int)map.get("total");
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker",pageDTO);
		model.addAttribute("list",list);
	}
	
	
	@PostMapping("/register")
	public String registerPost(BoardVO boardVO, RedirectAttributes rttr ) {
		Long bno = boardService.register(boardVO);
		rttr.addFlashAttribute("result",bno);
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(Long bno, Criteria criteria, Model model) {
		BoardVO boardVO = boardService.get(bno);
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCriteria(criteria);
		model.addAttribute("pageMaker" , pageDTO);		
		model.addAttribute("boardVO" , boardVO);		
		model.addAttribute("criteria" , criteria);		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO boardVO, Criteria cri, RedirectAttributes rttr) {
		boolean result = boardService.modify(boardVO);
		rttr.addFlashAttribute("modifyResult",result);
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("bno",boardVO.getBno());
		
		log.info("수정함");
		log.info("수정함");	
		log.info("수정함");
		return "redirect:/board/get";
		
	}
	
	@PostMapping("/remove")
	public String delete(Long bno,Criteria cri, RedirectAttributes rttr) {
		boolean result = boardService.delete(bno);
		rttr.addFlashAttribute("removeResult", result);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
	
		
		return "redirect:/board/list";
	}
	
	
	
	
	
	
	
}
