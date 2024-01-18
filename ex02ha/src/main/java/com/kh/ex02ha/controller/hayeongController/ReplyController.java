package com.kh.ex02ha.controller.hayeongController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ex02ha.service.ReplyService;

import lombok.extern.log4j.Log4j;

//비동기방식
@RestController
@RequestMapping("/replies")
@Log4j
public class ReplyController {

	@Autowired
	public ReplyService replyService;
	
	
}
