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
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	String sung = request.getParameter("sung");
	String hobby = String.join("," , request.getParameterValues("hobby"));
	String birth = request.getParameter("birth");

	//쿼리 생성
	String sql = "insert into gesipan (name, title, pwd, content, sung, hobby, birth, writeday) ";
	sql += " values (?, ?, ?, ?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, title);
	pstmt.setString(3, pwd);
	pstmt.setString(4, content);
	pstmt.setString(5, sung);
	pstmt.setString(6, hobby);
	pstmt.setString(7, birth);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//이동하고 싶은 문서
	response.sendRedirect("list.jsp");
	
	pstmt.close();
	conn.close();
%>

<!-- 
	--gesipan table
	
	create table gesipan(
	id int(5) auto_increment,
	name varchar(10),
	title VARCHAR(30),
	pwd varchar(10),
	content VARCHAR(30),
	sung varchar(10),
	hobby varchar(10),
	birth varchar(10),
	writeday date,
	primary key (id)
	);

 -->