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
	
	//request 값을 읽어오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	//쿼리 생성
	String sql = "update board set readnum = readnum + 1 where id=" + id;
	
	//심부름꾼 생성
	Statement stmt = conn. createStatement();
	
	//쿼리실행
	stmt.executeUpdate(sql);
	
	//페이지 이동
	response.sendRedirect("content.jsp?id="+id);

	
%>