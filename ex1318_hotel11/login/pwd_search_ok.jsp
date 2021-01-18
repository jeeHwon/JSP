<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="hotel.HotelDAO" %>
<%@ include file="../top.jsp" %>    
<style>
#section {width:1100px; height:500px ;margin:auto; text-align:center;}
#setcion #userid {width:600px; margin:auto; margin-top:30px;}
#setcion input[type=button] {width:150px; height:34px; background:#fff; color:white;
	font-weight:900; border:none; margin-top:30px;}
</style>
<%
	//입력값 가져오기
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	HotelDAO hdao = new HotelDAO();
	String pwd = hdao.pwd_search(userid, name, phone);
	pageContext.setAttribute("pwd", pwd);
	pageContext.setAttribute("name", name);
	
%>
<div id="section">
	<div id="userid">${name}님의 비밀번호 : ${pwd}입니다</div>
	<div id="button"><input type="button" onclick="location='login.jsp'" value="로그인"></div>

</div>

<%@ include file="../bottom.jsp" %> 
