<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<%@ include file="/WEB-INF/views/include/frmCriteria.jsp" %>
<script>
$(function(){
	//목록버튼
	$("a.list").click(function(e){
		e.preventDefaul();
		var frmCriteria = $("#frmCriteria");
		frmCriteria.attr("ation","/board/list");
		frmCriteria.attr("method","get");
		frmCriteria.find("inpuy[name=bno]").remove();
		frmCriteria.submit();
	});
	
	//수정버튼
	$("#frmModify").submit(function(){
		var frmCriteria = $("#frmCriteria");
		var pageNum = frmCriteria.find("input[name=pageNum]").clone();
		var amount = frmCriteria.find("input[name=amount]").clone();
		var type = frmCriteria.find("input[name=type]").clone();
		var keyword = frmCriteria.find("input[name=keyword]").clone();
		$(this).prepend(pageNum);
		$(this).prepend(amount);
		$(this).prepend(type);
		$(this).prepend(keyword);
		
	});
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					글수정
				</h2>
				
				<p>
					<a id="a-list" class="btn btn-primary btn-large" href="#">글목록</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form id="frmModify" role="form" action="/board/modify" method="post">
			<input type="hidden" name="bno" value="${boardVO.bno}"> <!-- form 안에 -->
				<div class="form-group">
					 
					<label for="title">
						제목
					</label>
					<input type="text" class="form-control" id="title"  name="title"
					value="${boardVO.title}" />
				</div>
				<div class="form-group">
					 
					<label for="content">
						내용
					</label>
					<textarea class="form-control" id="content" name="content">${boardVO.content}</textarea>
				</div>
				<div class="form-group">
					 
					<label for="writer">
						작성자
					</label>
					<input type="text" class="form-control" id="writer"  name="writer"
					value="${boardVO.writer}" />
				</div>
				<button type="submit" class="btn btn-primary">
					수정완료
				</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
    