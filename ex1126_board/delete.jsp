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
	
	//request 값 가져오기
	String pwd = request.getParameter("pwd");	//사용자가 입력한 비밀번호
	String id = request.getParameter("id");
	
	//DB에 있는 비밀번호 가져오기
	//쿼리 생성
	String sql = "select pwd from board where id=" + id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리 실행 후ResultSet에 담는다
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	if(pwd.equals(rs.getString("pwd"))) {
		sql = "delete from board where id="+ id;
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		response.sendRedirect("list.jsp");
	}  else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}
	
	stmt.close();
	conn.close();
%>
