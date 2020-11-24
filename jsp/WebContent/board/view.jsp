<%@page import="com.web.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.println("/borad/view.jsp"); %>

<%
// 여기는 자바입니다
// 데이터 : no 데이터 받기
String strNo = request.getParameter("no");
int no = Integer.parseInt(strNo);
BoardDAO dao = new BoardDAO();
dao.increase(no);
request.setAttribute("dto", dao.view(no));	//dao.view통해  dto 이름으로 받아옴


%>
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
		<td>${dto.no }</td>
	</tr>
		<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
		<tr>
		<th>내용</th>
		<td>
			<pre style="backgroundnone; border:none">${dto.content }
			</pre>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th>작성일자</th>
		<td>${dto.writeDate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${dto.hit }</td>
	</tr>
	<tr>
		<td colspan="2">
		<a href="updateForm.jsp?no=${dto.no }" class="btn btn-default">글수정</a>
		<a href="delete.jsp?no=${dto.no }" class="btn btn-default">글삭제</a>
		<a href="list.jsp" class="btn btn-default">리스트</a>
		</td>
	</tr>

</table>

</div>
</body>
</html>