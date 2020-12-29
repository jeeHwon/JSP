<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("kor", 99);
%>
</head>
<body>
	국어 : ${kor}<p>
	영어 : ${eng}<p>
	<c:if test="${eng eq null}">
		점수없음
	</c:if>
	<hr>
	국어 : <c:out value="${kor}"/><p>
	영어 : <c:out value="${eng}" default="점수없음"/><p>
</body>
</html>