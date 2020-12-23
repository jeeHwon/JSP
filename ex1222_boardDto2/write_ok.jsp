<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn_old"%>
<%@ page import="java.sql.*" %>
<%
	//DB 연결 - DB_Conn.java통해 Connection 객체 생성
	DB_Conn_old db = new DB_Conn_old();
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	//request된 값을 클래스에 넣고 클래스를 전달하는 방법Dto
	//전달하기 위한 Dto 객체 생성
	
	//메소드에 전달(insert)
	db.insert(title, name, content, pwd);
	
	response.sendRedirect("list.jsp");
%>