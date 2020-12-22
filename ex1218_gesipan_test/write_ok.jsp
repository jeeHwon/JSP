<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String content = request.getParameter("content");
	String gender = request.getParameter("gender");
	
	if(gender.equals("0")){
		gender = "남";
	} else{
		gender = "여";
	}
	
	String sql = "insert into gesipan2 (title, name, content, year, gender, writeday) ";
	sql += " values (?, ?, ?, ?, ?, now())";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, content);
	pstmt.setString(4, year);
	pstmt.setString(5, gender);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("list.jsp");
	
	pstmt.close();
	conn.close();
%>
<!-- 
	--gesipan2 table
	
create table gesipan2(
id int(5) auto_increment,
title varchar(10),
name varchar(10),
content varchar(100),
year varchar(4),
gender char(2),
writeday date,
primary key (id)
);

 -->