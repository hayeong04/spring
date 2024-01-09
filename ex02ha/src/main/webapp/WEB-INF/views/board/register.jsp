<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>



<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					글쓰기
				</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/board/list">글목록</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/board/register" method="post">
				<div class="form-group">
					 
					<label for="title">
						제목
					</label>
					<input type="text" class="form-control" id="title" name="title" />
				</div>
				<div class="form-group">
					 
					<label for="content">
						내용
					</label>
					<textarea class="form-control" id="content" name="content" ></textarea>
				</div>
				<div class="form-group">
					 
					<label for="writer">
						 작성자
					</label>
					<input type="text" class="form-control" id="writer" name="writer" />
				</div>
				<button type="submit" class="btn btn-primary">
					작성완료
				</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>