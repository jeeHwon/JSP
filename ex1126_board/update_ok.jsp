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
	
	//request 값을 읽어오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	//쿼리 생성
	String sql = "select pwd from board where id="+ id;
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리 실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	PreparedStatement pstmt = null;
	if(pwd.equals(rs.getString("pwd"))) {
		//쿼리생성
		sql = "update board set name=?, title=?, content=? where id=?";
		
		//심부름꾼
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, id);
		
		//쿼리 실행
		pstmt.executeUpdate();
		
		//페이지 이동
		response.sendRedirect("content.jsp?id="+id);
		pstmt.close();
	} else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
	
	stmt.close();
	conn.close();
%>