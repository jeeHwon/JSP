<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.HotelDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mdto" class="hotel.MemberDTO">
	<jsp:setProperty name="mdto" property="*"/>
</jsp:useBean>

<%
	HotelDAO hdao = new HotelDAO();
	hdao.member_ok(mdto);
	
	response.sendRedirect("login.jsp");
%>