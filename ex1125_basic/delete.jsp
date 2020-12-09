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
	
	//request값을 받는다
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "delete from member where id=" + id;
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리 실행
	stmt.executeUpdate(sql);
	
	//보여주고 싶은 문서로 이동
	response.sendRedirect("list.jsp");
	
	
%>