<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.HotelDAO" %>
<%
	// 입력한 userid 값을 읽어오기
	String userid = request.getParameter("userid");

	HotelDAO hdao = new HotelDAO();
	int chk = hdao.isUserid(userid);
	
	out.print(chk);
	
	
%>