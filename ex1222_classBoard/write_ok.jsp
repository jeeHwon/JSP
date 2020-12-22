<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn"%>
<%@ page import="java.sql.*" %>
<%
	//DB 연결 - DB_Conn.java통해 Connection 객체 생성
	DB_Conn db = new DB_Conn();
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	//동작을 하는 DB_Conn 클래스에 있는 메소드에 값을 전달
	db.insert(title, name, content, pwd);
	
	response.sendRedirect("list.jsp");

	
%>