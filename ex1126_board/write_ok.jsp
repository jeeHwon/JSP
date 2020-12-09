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
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	//쿼리 생성
	String sql = "insert into board (title, name, content, pwd, writeday) ";
	sql += " values (?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, content);
	pstmt.setString(4, pwd);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//이동하고 싶은 문서
	response.sendRedirect("list.jsp");
	
	pstmt.close();
	conn.close();
%>

<!-- 
	--board table
	
	create table board(
	id int(5) auto_increment,
	title varchar(10),
	name varchar(10),
	content varchar(10),
	pwd varchar(10),
	readnum INT(5) default 0,
	writeday date,
	primary key (id)
	);

 -->