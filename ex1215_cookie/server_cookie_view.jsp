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
	//쿠키를 읽어오기
	Cookie[] cookie = request.getCookies();
	for(int i = 0; i<cookie.length; i++){
		out.print(cookie[i].getName());
		out.print(" : ");
		out.print(cookie[i].getValue());
		out.print("<p>");
	}
%>
<form method="post" action="server_cookie_del.jsp">
	삭제할 쿠키명<input type="text" name="cname"> 
	<input type="submit" value="쿠키삭제">
</form>
<p>
<hr>
<form method="post" action="server_cookie_add.jsp">
	생성할 쿠키명<input type="text" name="cname"> 
	쿠키의 값<input type="text" name="cvalue">
	<input type="submit" value="쿠키생성">
</form>

</body>
</html>
