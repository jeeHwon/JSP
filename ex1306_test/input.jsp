<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!-- page 처리 연습하기 위해 반복하여 넣는 파일 -->
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/mydb";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
	String name = "아이유";
	String title = "페이지처리 연습중";
	String pwd = "1";
	String content = "너랑나랑은 지금 ";
	
	//쿼리 생성
	for(int i= 1; i<=100; i++){
		String sql = "insert into board (name, title, pwd, content, writeday) ";
		sql += " values (?, ?, ?, ?, now())";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name+" "+i);
		pstmt.setString(2, title+" "+i);
		pstmt.setString(3, pwd);
		pstmt.setString(4, content);

		//쿼리 실행
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	//이동하고 싶은 문서
	response.sendRedirect("list.jsp");
	conn.close();
%>
