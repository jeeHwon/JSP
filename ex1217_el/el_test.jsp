<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- EL 표현식 -->
<%
	String name = "batman";

	//영역을 가지는 객체 => application, session, request, pageContext 를 부르는 방법
	session.setAttribute("name", "superman");
	
			
			
%>
기존방식 : <%=session.getAttribute("name") %><p>
EL표현식 : ${name}

</body>
</html>