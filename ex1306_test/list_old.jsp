<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	BoardDao bdao = new BoardDao();
	ArrayList<BoardDto> list = bdao.list();
	pageContext.setAttribute("list", list);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="600" align="center">
	<tr>
		<td>이름</td>
		<td>제목</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
	<c:forEach items="${list}" var="bdto">
	<tr>
		<td>${bdto.name}</td>
		<td><a href="readnum.jsp?id=${bdto.id}">${bdto.title}</a></td>
		<td>${bdto.readnum}</td>
		<td>${bdto.writeday}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="center"><a href="write.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>