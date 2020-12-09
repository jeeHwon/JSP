<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//한글처리 (request값)
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String juso = request.getParameter("juso");
	
	
	//쿼리 생성
	String sql = "insert into member (name, age, juso) values ";
	sql += "('"+name+"', "+age+", '"+juso+"')";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
	//list로 이동
	response.sendRedirect("list.jsp");
	
%>

<!-- 
	--DB member
	create table member(
	name varchar(10),
	age varchar(10),
	juso varchar(10)
	);

 -->