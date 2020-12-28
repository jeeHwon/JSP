<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "jspPJ.BoardDto_old" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	BoardDto_old bd = new BoardDto_old();
	bd.setTitle(title);
	bd.setName(name);
	bd.setContent(content);
	bd.setPwd(pwd);
	
%>
제목: <%=bd.getTitle() %><p>
작성자: <%=bd.getName() %><p>
내용: <%=bd.getContent() %><p>
</body>
</html>