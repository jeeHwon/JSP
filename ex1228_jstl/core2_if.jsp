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
<!-- if문에 해당하는 core 태그 -->
<%
	int age = 18;
	pageContext.setAttribute("age", age);
%>
	<!-- core 태그 if -->
	<c:if test="${age>=20}">	<!-- test 안에 조건문 넣어야함 -->
	코어-어서오세요
	</c:if>
	<c:if test="${age<20}">	<!-- else 문이 없어 if문으로 입력 -->
	코어-커서오세요
	</c:if>
	<hr>


<%	if(age>=20){ %>
		어서 오세요
<%	} else{%>
		커서 오세요
<%	} %>

</body>
</html>