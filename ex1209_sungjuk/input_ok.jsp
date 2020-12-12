<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//request 값
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	String sci = request.getParameter("sci");

	//쿼리 생성
	String sql = "insert into sung(name, pwd, kor, eng, mat, sci, writeday )";
	sql = sql + " values(?,?,?,?,?,?,now())";
	
	/*
	create table sung(
	id int auto_increment primary key,
	name char(10),
	pwd char(10),
	kor char(10),
	eng char(10),
	mat char(10),
	sci char(10),
	writeday date
	);
	*/
	
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, kor);
	pstmt.setString(4, eng);
	pstmt.setString(5, mat);
	pstmt.setString(6, sci);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	
	//이동(list.jsp)
	response.sendRedirect("sung_view.jsp");
%>