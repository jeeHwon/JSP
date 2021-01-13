<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.dao.Dao" %>
<%@ page import="java.util.ArrayList"%>
<%
	Dao dao = new Dao();
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	ArrayList<String> list = dao.view_day(year, month, day);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
선택한 날짜 :${list.get(0)}<p>
100일뒤 :${list.get(1)}<p>
1년뒤 :${list.get(2)}<p>
10년뒤 :${list.get(3)}<p>
</body>
</html>