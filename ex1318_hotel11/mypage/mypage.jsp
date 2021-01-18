<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<%@ page import="hotel.HotelDAO" %>    
<%@ page import="hotel.MemberDTO" %>    
<%@ page import="hotel.ReserveDTO" %>    
<%@ page import="java.util.ArrayList" %>    
<%
	HotelDAO hdao = new HotelDAO();
	MemberDTO mdto = hdao.mypage(session.getAttribute("userid").toString());
	pageContext.setAttribute("mdto", mdto);
	
	ArrayList<ReserveDTO> list = hdao.my_reserve(session.getAttribute("userid").toString());
	pageContext.setAttribute("list", list);

%>
<style>
#section {width:1100px; height:500px ;margin:auto; text-align:center;}
#section #my {width:600px; height:300px; border:1px solid black;}
#section #reserve {width:600px; height:300px; border:1px solid black;}
</style>

<div id="section" algin="center">
	<div id="my">
		<table width="590" align="center">
			<caption><h3>나의 회원정보</h3></caption>
			<tr>
				<td>이름</td>
				<td>${mdto.name}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${userid}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${mdto.phone}</td>
			</tr>
		</table>
	</div>
	<div id="reserve">
		<table width="590" align="center">
			<caption><h3>나의 예약정보</h3></caption>
			<tr>
				<td>룸명</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>옵션1</td>
				<td>옵션2</td>
				<td>옵션3</td>
				<td>예약일</td>
			</tr>
			<c:forEach var="rdto" items="${list}">
			<tr>
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