package com.kh.ex02ha.domain.hayeongDomain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Criteria {

	private int pageNum;
	private int amount;
	private int startRow;
	private int endRow;
	
	private String type; //검색조건
	private String keyword; //검색어
	
	public Criteria() {
		this(1, 10, 1, 10);
		setRows();
	}
	
	public Criteria(int pageNum, int amount, int startRow, int endRow) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	private void setRows() {
		endRow = pageNum * amount;
		startRow = endRow -(amount - 1);
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		setRows();
	}
	
	public String[] getTypeArr() {
		return type == null ? new String [] {} : type.split("");
	}
	
	
	
}
