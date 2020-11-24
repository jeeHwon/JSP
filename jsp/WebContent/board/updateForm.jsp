<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	System.out.println("/borad/updateFrom.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>
<!-- 라이브러리 등록 - jQuery, Bootstrap : CDN방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		history.back()
	})
})
</script>
</head>
<body>
	<div class="container">
		<h1>게시판 글수정</h1>
		<form action="update.jsp" method="post">
			<div class="form-group">
				<label for="no">글번호</label> <input type="text" class="form-control"
					id="no" name="no" readonly="readonly" value="10">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title" value="JSP란?" required="required">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content">자바기반의 프로그램입니다</textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" name="writer" value="탕웨이">
			</div>
			<button class="btn btn-defalut">수정</button>
			<button class="btn btn-defalut" type="reset">다시입력</button>
			<button class="btn btn-defalut" type="button" id="cancelBtn">취소</button>
		</form>
	</div>
</body>
</html>