<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.HotelDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="rdto" class="hotel.ReserveDTO">
	<jsp:setProperty name="rdto" property="*"/>
</jsp:useBean>

<%
	HotelDAO hdao = new HotelDAO();
	String userid = session.getAttribute("userid").toString();
	hdao.insert(rdto, userid);
	response.sendRedirect("reserve_view.jsp?userid="+userid);
%>
<%=request.getParameter("inwon1") %>
<%=request.getParameter("inwon2") %>
<%=request.getParameter("inwon3") %>
<%=request.getParameter("suk_price") %>
<%=request.getParameter("etc_price") %>
<%=request.getParameter("tot_price") %>
