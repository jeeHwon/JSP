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
	<select>
		<c:forEach var="i" begin="1960" end="2020" step="1">
			<option value="${i}">${i}</option>
		</c:forEach>
	</select>
	<select>
		<c:forEach var="i" begin="0" end="60" step="1">	<!-- step은 양수만 -->
			<option value="${2020-i}">${2020-i}</option>
		</c:forEach>
	</select>

</body>
</html>