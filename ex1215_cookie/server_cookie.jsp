<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Cookie cookie = new Cookie("name", "batman");
	cookie.setMaxAge(600);
	response.addCookie(cookie);	//클라이언트에 쿠키 변수를 저장
	
	cookie = new Cookie("age", "33");
	cookie.setMaxAge(600);
	response.addCookie(cookie);	//클라이언트에 쿠키 변수를 저장
	
%>
