<%@page import="hotel.ReserveDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hotel.HotelDAO" %>  
<%@ page import="java.util.ArrayList" %>  
<%
	HotelDAO hdao = new HotelDAO();
	ArrayList<ReserveDTO> list = hdao.admin_reserve();
	pageContext.setAttribute("list", list);
%>
<style>
#section{width:1100px; height:500px ;margin:auto; text-align:center;}
#section #reserve {width:700px; margin:auto; margin-top:40px;}
</style>

<div id="section">
	<div id="reserve">
		<table width="700" align="center">
			<tr>
				<td>이름</td>
				<td>전화번호</td>
				<td>숙소명</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>옵션1</td>
				<td>옵션2</td>
				<td>옵션3</td>
				<td>예약일</td>
			</tr>
			<c:forEach var="rdto" items="${list }">
			<tr>
				<td>${rdto.name}</td>
				<td>${rdto.phone}</td>
				<td>${rdto.roomname}</td>
				<td>${rdto.inday}</td>
				<td>${rdto.outday}</td>
				<td>${rdto.opt1}</td>
				<td>${rdto.opt2}</td>
				<td>${rdto.opt3}</td>
				<td>${rdto.writeday}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>

<%@ include file="../bottom.jsp" %> 