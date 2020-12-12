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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//DB에 있는 비밀번호 가져오기
	String sql ="select pwd, gid from dat where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//입력한 비밀번호와 DB 비밀번호 비교
	if(pwd.equals(rs.getString("pwd"))){
		//쿼리 생성
		sql = "delete from dat where id="+id;
		
		//심부름꾼
		stmt = conn.createStatement();
		
		//쿼리 실행
		stmt.executeUpdate(sql);
	}
		//이동하고 싶은 문서
	response.sendRedirect("content.jsp?id="+rs.getString("gid"));
	stmt.close();
	conn.close();
%>