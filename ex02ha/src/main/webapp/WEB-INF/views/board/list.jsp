<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<script>
$(function(){
	
	var result = '<c:out value="${result}"/>';
	var removeResult = "${removeResult}";
	
	var title ="";
	var msg = "";
	if(result){
		title ="등록";
		msg = result +"번 게시글이 등록 되었습니다.";
	} else if(removeResult){
		title ="삭제"
		msg ="삭제 되었습니다.";
	}
	//모달
	if(result || removeResult){
		$("#modal-result").find(".modal-body").text(msg);
		$("#modal-result").fine(".modal-title").text(title);
		$("#modal-result").modal("show");
	}
	
	//글제목 클릭
	$("a.a-title").click(function(e){
		e.preventDefault();
		var frmCriteria = $("#frmCriteria");
		var bno = $(this).attr("href");
		frmCriteria.find("input[name=bno]").val(bno);
		frmCriteria.attr("action","/board/get");
		frmCriteria.submit();
		
	});
	
	//페이지 번호
	$("a.page-item").click(function(e){
		e.preventDefault();
		var bfrmCriteria = $("#frmCriteria");
		var pageNum =  $(this).attr("href");
		frmCriteria.find("input[name=pageNum]").val(pageNum);
		frmCriteria.find("input[name=bno]").remove();
		frmCriteria.attr("action","board/list");
		frmCriteria.submit();
		
	});
	
	//검색폼
	$("#frmSearch").submit(function(){
		var type = $(this).find("[name=type]").val();
		if(type == ""){
			alert("검색 조건을 선택해주세요");
			$("[name=type]").focus();
			return false;
		}
		var keyword = $(this).find("[name=keyword]").val();
		if(keyword.trim() == ""){
			alert("검색어를 입력해주세요");
			$("[name=keyword]").focus();
			return false;
		}
	});
	
});
</script>
<%@ include file="/WEB-INF/views/include/frmCriteria.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					글목록
				</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/board/register">글쓰기</a>
				</p>
			</div>
		</div>
	</div>
	<!-- 검색 -->
	<div class="row">
		<div class="col-md-12">
		 <form action="/board/list" method="get" id="frmSearch">
		 <label>검색</label>
		 <select name="type">
		 	<option value="">------------</option>
		 	<option value="T" ${param.type == 'T' ? 'selected' : ''}>제목</option>
		 	<option value="C" ${param.type == 'C' ? 'selected' : ''}>내용</option>
		 	<option value="W" ${param.type == 'W' ? 'selected' : ''}>작성자</option>
		 	<option value="TC" ${param.type == 'TC' ? 'selected' : ''}>제목 + 내용</option>
		 	<option value="TW" ${param.type == 'TW' ? 'selected' : ''}>내용 + 작성자</option>
		 	<option value="TCW" ${param.type == 'TCW' ? 'selected' : ''}>제목 + 내용 + 작성자</option>
		 </select>
		 <input type="text" name="keyword" value="${param.keyword}">
		 <button type="submit" class="btn btn-sm btn-success">검색</button>
		 </form>
		</div>
	</div>

	<!-- 검색 끝 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="boardVO">
					<tr>
						<td><c:out value="${boardVO.bno}"/></td>
						<td>
							<a class="a-title" href='<c:out value="${boardVO.bno}"/>'>
							<c:out value="${boardVO.title}"/>
							</a>	
						</td>
						<td><c:out value="${boardVO.writer}"/></td>
						<td><fmt:formatDate value="${boardVO.regdate}"
							pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${boardVO.updatedate}"
							pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- pagination -->
		<div class="row">
		<div class="col-md-12">
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev == true}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.startPage - 1}">&laquo;</a>
					</li>
					</c:if>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<c:if test="${pageMaker.next == true}">
					<li class="page-item">
						<a class="page-link" id="endPage" href="${pageMaker.endPage + 1}">&raquo;</a>
					</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	
	<!-- //pagination 끝-->
		<!-- 모달 -->
	<div class="row">
		<div class="col-md-12">
		<a style="display:none;"
			 id="modal-131237" href="#modal-result" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-result" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								Modal title
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							...
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	
	<!-- 모달끝 -->
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>