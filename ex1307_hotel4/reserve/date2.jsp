<%@page import="java.time.LocalDate"%>
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
	<h3>Date, Calendar, LocalDateTime을 이용한 특정시간 만들기</h3>
	
	<!-- Date 클래스는 1900년부터 시작, 월:0~11 -->
	<c:set var="today1" value="<%=new java.util.Date(2022-1900, 7-1, 18)%>"/>
	${today1}
	<hr>
	
	<!-- Calendar 클래스는 특정날짜를 가진 객체를 생성 => set(년,월,일) 메서드 이용 -->
	<%
		java.util.Calendar today2 = java.util.Calendar.getInstance();
		today2.set(2022,7,18);
	%>
	<c:set var="today2" value="<%=today2%>"/>
	${today2}
	<hr>
	
	<c:set var="today3" value="<%=LocalDate.of(2022,7,18)%>"/>
	${today3}
	<hr>
	
    <!-- 년, 월, 일을 가져오기 -->
    ${today3.year} : ${today3.getYear()} : ${today3.getMonthValue()} : ${today3.monthValue }

</body>
</html>