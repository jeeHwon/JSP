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
	String[] member={"강백호", "채치수", "정대만", "송태섭", "서태웅"};
	for (String name:member){
		out.print(name+"<p>");
	}
	out.print("<hr>");

	pageContext.setAttribute("member", member);
%>

<c:forEach items="${member}" var="name">	<!-- while문의 형태 -->
	코어-${name}<p>
</c:forEach>

</body>
</html>