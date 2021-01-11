<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>view에 현재시간을 가져오는 방법</h3>
	<p>el 표현식으로 날짜에 접근 => pageContext 영역</p>
	<p>방법1</p>
	<%
	pageContext.setAttribute("today1", new java.util.Date());
	%>
	${today1}
	<hr>
	
	<p>방법2</p>
	<c:set var="today2" value="<%=new java.util.Date() %>"/> 
	${today2}
	<hr>
	
	<p>방법3</p>
	<jsp:useBean id="today3" class="java.util.Date"/>
	${today3}
	
</body>
</html>