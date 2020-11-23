<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판리스트</h1>
	<h2><a href="writeForm.jsp">글쓰기</a></h2>
	
	<h2><a href="view.jsp">글보기</a></h2>
	<%request.setCharacterEncoding("UTF-8");%>
    <%String name = (String)request.getParameter("content");%>
 
    <hr>
    	글 목록입니다
    <hr>
    
    글 내용 :<%= name %>
    <br> 
   
</body>
</html>