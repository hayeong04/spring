package com.kh.ex02ha.domain.hayeongDomain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PageDTO {
	
	private Criteria criteria;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	private int total;
	
	public PageDTO(Criteria criteria, int total) {
		this.criteria = criteria;
		this.total = total;
		
		endPage = (int)(Math.ceil(criteria.getPageNum() /10.0)) *10; //페이징의 끝번호 계산
		startPage = endPage - 9; 	//페이징의 시작번호 계산
		
		int realEnd = (int)(Math.ceil((float)total / criteria.getAmount()));
		if(realEnd < endPage) {
			endPage = realEnd; 	 //total을 통한 endPage의 재계산
		}
		
		prev = startPage > 1;			//이전페이지 계산
		next = endPage < realEnd;		//다음페이지 계산
	}
	
}
