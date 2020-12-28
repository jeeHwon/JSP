<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String name = "아나 데아르마스";
	int age = 33;

	//중복시 적용순서
	application.setAttribute("name", "아나 데아르마스");
	session.setAttribute("name", "라이언 고슬링");
	request.setAttribute("name", "해리슨 포드");
	pageContext.setAttribute("name", "스칼렛 요한슨");	
	pageContext.setAttribute("age", age);
	
	//getAttribute로 불러올 수 있다.
	String name = (String)session.getAttribute("name");
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>
${name } <%=name %> ${age }
</body>
</html>