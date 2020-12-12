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
	
	//rewrite에서 grp, seq, depth를 받는다
	String grp = request.getParameter("grp");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int depth = Integer.parseInt(request.getParameter("depth"));

	//답글이므로 부모글의 seq, depth를 1씩 증가시킨다
	seq++;
	depth++;
	
	//기존의 현재 들어갈 레코드의 seq보다 같거나 큰값들은 1씩 증가
	String sql2 = "update qna set seq = seq + 1 where seq >="+seq+" and grp="+grp;
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql2);
	
	//쿼리작성
	String sql = "insert into qna (title, name, pwd, content, grp, seq, depth, writeday) ";
	sql += " values (?, ?, ?, ?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.setString(4, content);
	pstmt.setString(5, grp);
	pstmt.setInt(6, seq);
	pstmt.setInt(7, depth);
	
	//쿼리실행
	pstmt.executeUpdate();
	
	//이동 => list
	response.sendRedirect("list.jsp");
	
	pstmt.close();
	conn.close();
	
%>









