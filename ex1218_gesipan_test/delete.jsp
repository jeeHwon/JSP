<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	String id = request.getParameter("id");
	
	String sql = "delete from gesipan2 where id="+ id;
	
	Statement stmt = conn.createStatement();
	
	stmt.executeUpdate(sql);
	response.sendRedirect("list.jsp");
	
	stmt.close();
	conn.close();
%>
