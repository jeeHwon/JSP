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
	<!-- core 태그에서 값을 설정하기 -->
	<c:set var="eng" value="88"/>
	국어 : ${kor }<p>
	영어 : ${eng }<p>
<%
	String[] name = {"조커","할리퀸","펭귄맨"};
	pageContext.setAttribute("name", name);
%>

	<c:set var="num" value="1"/>
	<c:forEach var="tt" items="${name}">
		${num} : ${tt}<p>
		<c:set var="num" value="${num+1 }"/>
		
	</c:forEach>
</body>
</html>