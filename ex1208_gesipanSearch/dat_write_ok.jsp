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
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
	String gid = request.getParameter("gid");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	
	//쿼리 생성
	String sql = "insert into dat (name, pwd, content, gid, writeday) ";
	sql += " values (?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pwd);
	pstmt.setString(3, content);
	pstmt.setString(4, gid);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//이동하고 싶은 문서
	response.sendRedirect("content.jsp?id="+gid);
	
	pstmt.close();
	conn.close();
%>

<!-- 
	--dat table
	
	create table dat(
	id int(5) auto_increment,
	name varchar(10),
	pwd varchar(10),
	content VARCHAR(30),
	gid int(5),
	writeday date,
	primary key (id)
	);

 -->