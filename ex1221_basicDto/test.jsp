<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspPJ.Test"%>
<%@ page import= "jspPJ.My" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
성적처리하기 <p>
<%=Test.haha() %><p>
<%
	jspPJ.Test t = new jspPJ.Test();
	My m = new My();
%>

합계 : <%=t.hap() %><p>
출력 : <%=m.print() %><p>

</body>
</html>