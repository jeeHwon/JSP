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
<%
	for(int i=1; i<=10; i++){
		out.print("하하하<br>");
	}
%>
<hr>
<c:forEach var="i" begin="1" end="10" step="1">
	코어-하하하~<br>
</c:forEach>

</body>
</html>