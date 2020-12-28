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
<!-- el 표현식은 내부에 연산처리 가능 -->
<%
	pageContext.setAttribute("kor", 99);
	pageContext.setAttribute("eng", "88");
	
%>
출력 : ${kor } ${eng }<p>
더하기 : ${kor+10 } ${eng+10 }<p>
나머지 : ${kor%10 } ${eng mod 10 }<p>
비교 : ${kor> eng } ${eng gt kor }<p>

</body>
</html>