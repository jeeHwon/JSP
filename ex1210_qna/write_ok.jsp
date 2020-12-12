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
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	
	//--grp값 가져오기
	//seq, depth, grp => 질문글이므로 seq, depth는 기본값을 이용하고, grp만 구하면 된다
	//쿼리생성	//ifnull(필드명, 값) => 필드가 null이면 값으로 출력
	String sql = "select ifnull(max(grp), 0) as grp from qna";	//grp 값 있으면 가져오고 없으면 0
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	int grp = rs.getInt("grp") + 1;
	
	//--질문글 저장하기
	//쿼리생성
	sql = "insert into qna(title, name, pwd, content, grp, writeday)";
	sql += " values (?, ?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.setString(4, content);
	pstmt.setInt(5, grp);
	
	//쿼리실행
	pstmt.executeUpdate();
	
	//이동 => list
	response.sendRedirect("list.jsp");
	
	pstmt.close();
	conn.close();
	
%>