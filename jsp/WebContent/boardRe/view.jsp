<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.println("/borad/view.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글보기</title>
<!-- 라이브러리 등록 - jQuery, Bootstrap : CDN방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
<h1>게시판 글보기</h1>
<table class="table">
	<tr>
		<th>번호</th>
		<td>10</td>
	</tr>
		<tr>
		<th>제목</th>
		<td>JSP란??</td>
	</tr>
		<tr>
		<th>내용</th>
		<td>
			<pre style="backgroundnone; border:none">
아이돈노우
오예
			</pre>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>윤은혜</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>300</td>
	</tr>
	<tr>
		<td colspan="2">
		<a href="updateForm.jsp" class="btn btn-default">글수정</a>
		<a href="delete.jsp" class="btn btn-default">글삭제</a>
		<a href="list.jsp" class="btn btn-default">리스트</a>
		</td>
	</tr>

</table>

</div>
</body>
</html>