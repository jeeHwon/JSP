<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn"%>
<%@ page import="jspPJ.dto.BoardDto"%>
<%@ page import="java.sql.*" %>
<%
	//DB 연결 - DB_Conn.java통해 Connection 객체 생성
	DB_Conn db = new DB_Conn();
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
%>
	<!-- requset.getParameter 값으로 bdto에 set 하는 방식(old) -->
	<jsp:useBean id="bdto" class="jspPJ.dto.BoardDto">
		<jsp:setProperty name="bdto" property="*" /><!-- 폼태그의 name과 BoardDto의 필드명은 일치해야 한다-->
	</jsp:useBean>
<%

	//메소드에 전달(insert)
	db.insert(bdto);
	
	response.sendRedirect("list.jsp");
%>