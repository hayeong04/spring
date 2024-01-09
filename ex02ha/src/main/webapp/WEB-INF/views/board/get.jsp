<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>    

<script>
$(function(){ 
	$("a.btn-oper").click(function(e){
		e.preventDefault();
		var btn = $(this).data("oper");
		var frmCriteria = $("#frmCriteria");
		var action = "";
		switch(btn){
		case "modify":
			action = "/board/modify";
			frmCriteria.attr("method","get");
			break;
		case "delete":
			action ="/board/remove";
			frmCriteria.attr("method","post");
			break;
			
		}
		frmCriteria.attr("action",action);
		frmCriteria.submit();
	});
	//목록버튼
	$("#a-list").click(function(e){
		e.preventDefault();
		var frmCriteria = $("#frmCriteria");
		frmCriteria.attr("action","/board/list");
		frmCriteria.submit();
	});
	
	
	
});	
</script>
<%@ include file="/WEB-INF/views/include/frmCriteria.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					글조회
				</h2>
				
				<p>
					<a class="btn btn-primary btn-large" href="#" id="a-list">글목록</a>
				</p>
			</div>
		</div>
	</div>
	<!-- 목록으로 이동 폼-->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-12"> -->
<!-- 			<form id="frmList" action="/board/list" method="get"> -->
<%-- 				<input type="hidden" name="pageNum" value="${param.pageNum}"> --%>
<%-- 				<input type="hidden" name="amount" value="${param.amount}"> --%>
<!-- 			</form> -->
		
<!-- 			</div> -->
<!-- 		</div> -->
	<div class="row">
		<div class="col-md-12">
				<div class="form-group">
					 
					<label for="title">
						번호
					</label>
					<input type="text" class="form-control" id="title"  name="title" 
					value="${boardVO.bno}" readonly/>
				</div>		
				<div class="form-group">
					 
					<label for="title">
						제목
					</label>
					<input type="text" class="form-control" id="title"  name="title"
					value="${boardVO.title}" readonly/>
				</div>
				<div class="form-group">
					 
					<label for="content">
						내용
					</label>
					<textarea class="form-control" id="content" name="content" 
					readonly>${boardVO.content}</textarea>
				</div>
				<div class="form-group">
					 
					<label for="writer">
						작성자
					</label>
					<input type="text" class="form-control" id="writer"  name="writer"
					value="${boardVO.writer}" readonly>
				</div>
				<div class="form-group">
					 
					<label for="regdate">
						작성일
					</label>
					<input type="text" class="form-control" id="regdate"  name="regdate"
					value='<fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd"/>'
					readonly>
				</div>
				<div class="form-group">
					 
					<label for="updatedate">
						수정일
					</label>
					<input type="text" class="form-control" id="updatedate"  name="updatedate"
					value='<fmt:formatDate value="${boardVO.updatedate}" pattern="yyyy-MM-dd"/>'
					 readonly/>
				</div>
				<div class="form-group">
					<!-- 수정페이지로 이동 -->
					<a data-oper="modify" href="#" class="btn btn-warning btn-oper">
						수정
					</a>
					<a data-oper="delete" class="btn btn-danger btn-oper">
						삭제
					</a>
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<form id="frmOper"> -->
					
<!-- 					</form> -->
<!-- 				</div> -->
				
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<button id="btn-reply-list" class="btn btn-small btn-success">
					댓글목록
				<span class="badge badge-light" id="replycntSpan">${boardVO.replycnt}</span></button>
			<button id="btn-reply-new" class="btn btn-small btn-dark">댓글등록</button>
		</div>
	</div>
	<hr>
	<!-- 댓글 등록 모달창 -->
	<div class="row">
		<div class="col-md-12">
<!-- 			 <a id="modal-329145" href="#modal-container-329145" role="button" class="btn" data-toggle="modal">Launch demo modal</a> -->
			
			<div class="modal fade" id="modal-reply" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								댓글등록
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="reply">댓글내용</label>
							<input type="text" class="form-control" id="reply">
							<label for="replyer">댓글러</label>
							<input type="text" class="form-control" id="replyer">
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btn-reply-save">
								저장
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	
	<!-- 댓글 등록 모달창 끝 -->
	
	<!-- 댓글 목록 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table" id=reply_table style="display:none;">
				<thead>
					<tr>
						<th>#</th>
						<th>댓글내용</th>
						<th>댓글러</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<!-- 댓글목록 끝 -->
</div>
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>  