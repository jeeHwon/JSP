<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%
	request.setCharacterEncoding("utf-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	int yy = Integer.parseInt(year);
	int mm = Integer.parseInt(month);
	int dd = Integer.parseInt(day);
	
	LocalDate inday = LocalDate.of(yy, mm, dd);
	LocalDate after100day = inday.plusDays(100);
	LocalDate after1year = inday.plusYears(1);
	LocalDate after10year = inday.plusYears(10);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
선택한 날짜:<%=inday %><p>
100일뒤:<%=after100day%><p>
1년뒤:<%=after1year%><p>
10년뒤:<%=after10year%><p>
</body>
</html>