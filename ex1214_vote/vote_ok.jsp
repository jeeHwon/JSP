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
	String anju = request.getParameter("anju");	//a1, a2, a3, a4, a5, a6, a7 이라는 값중 하나가 넘어온다

	//쿼리 생성
	String sql = "update vote set "+anju+" = "+anju+" + 1 where id=1 ";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리 실행
	stmt.executeUpdate(sql);
	
	//이동하고 싶은 문서 =? 결과 보기 => vote_view.jsp
	response.sendRedirect("vote_view.jsp");
	
	stmt.close();
	conn.close();
%>
<!-- 
create table vote(
id int auto_increment primary key,
a1 int default 0,
a2 int default 0,
a3 int default 0,
a4 int default 0,
a5 int default 0,
a6 int default 0,
a7 int default 0,
bigo varchar(50)
);



 -->