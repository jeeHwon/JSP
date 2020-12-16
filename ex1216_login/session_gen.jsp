<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 객체는 내부객체. 따라서 이미 만들어져 있어 =>웹서버 내의 전역변수 역할
	
	// 세션변수 만들기
	session.setAttribute("userid", "jsw");	//(변수명, 값)

	
%>
<!DOCTYPE html>
<html>	<!-- session_gen.jsp -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	out.print(session.getAttribute("userid"));
	String name = "홍길동";
%>
<a href="next.jsp">다음페이지</a>

</body>
</html>

<!-- 
회원가입 테이블 생성
create table member2(
userid char(10),
pwd char(10)
);
_

만들문서
로그인창을 가지고 있는 index.jsp, login.jsp, login_ok.jsp

 -->