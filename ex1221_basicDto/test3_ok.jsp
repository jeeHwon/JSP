<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "jspPJ.My" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//시작값~ 끝값 까지의 합을 구하기
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	
	My m = new My();
	int result = m.sumStartToEnd(start, end);
%>
<%=start %>에서 <%=end %> 까지의 합 : <%=result %>
</body>
</html>