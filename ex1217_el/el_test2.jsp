<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = "batman";
	String age = "44";
	
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("test", "hahaha");
	
	String test = pageContext.getAttribute("test").toString();
	out.print(test);
	
	
%>
</body>
</html>
