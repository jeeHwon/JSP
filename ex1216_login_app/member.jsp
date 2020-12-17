<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")==null){
		//로그인을 하세요
		response.sendRedirect("login.jsp");
	} else{
		
	}
%>
<!DOCTYPE html>
<html>
<head>	<!-- member.jsp : 회원만 볼수 있음(로그인 한 회원) -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마이페이지</h2>
	<ul>
		<li><a>회원정보변경</a></li>
		<li><a>주문내역</a></li>
		<li><a>장바구니</a></li>
		<li><a>결제내역</a></li>
	</ul>
	<hr>
	<a href="index.jsp">홈으로 이동</a>
</body>
</html>