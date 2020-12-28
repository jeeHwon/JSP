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
	
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	
	//쿼리 생성
	String sql = "select count(*) as cnt from member2 where userid='"+userid+"' ";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리 실행
	
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	out.print(rs.getInt("cnt"));	//1 or 0
	
	stmt.close();
	conn.close();
%>