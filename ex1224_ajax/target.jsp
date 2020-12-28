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
	
	//쿼리 생성
	//String sql = "create table imsi2 (id int) ";
	
	//심부름꾼
	//Statement stmt = conn.createStatement();
	
	//쿼리 실행
	//stmt.executeUpdate(sql);
	
	out.print("완료");
	
	//stmt.close();
	//conn.close();
%>