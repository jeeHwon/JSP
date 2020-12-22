<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "jspPJ.My" %>
<%@ page import= "jspPJ.Dto" %>
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
	
	//int result = m.sumStartToEnd(start, end); 값을 따로따로 보내는 개념
	
	//값을 저장할 수 있는 class를 생성후에 class를 보내는 방법
	//Dto 클래스에 request된 값을 저장하기
	Dto d = new Dto();
	d.setStart(start);
	d.setEnd(end);
	
	My m = new My();
	int result = m.sumStartToEnd(d);
	
%>
<%=start %>에서 <%=end %> 까지의 합: <%=result %>
</body>
</html>