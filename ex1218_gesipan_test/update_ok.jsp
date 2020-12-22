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
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	
	if(gender.equals("0")){
		gender = "남";
	} else{
		gender = "여";
	}

	String sql = "update gesipan2 set name=?, title=?, content=?, gender=?, year=? where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setString(4, gender);
	pstmt.setString(5, year);
	pstmt.setString(6, id);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("content.jsp?id="+id);
	pstmt.close();
	
	conn.close();
%>