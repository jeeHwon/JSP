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
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	
	//DB에 있는 비밀번호 가져오기
	String sql ="select pwd, gid from dat where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//입력한 비밀번호와 DB 비밀번호 비교
	if(pwd.equals(rs.getString("pwd"))){
		//쿼리 생성
		sql = "update dat set name=?, content=? where id=?";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, content);
		pstmt.setString(3, id);
		
		//쿼리 실행
		pstmt.executeUpdate();
		pstmt.close();
	}
		//이동하고 싶은 문서
	response.sendRedirect("content.jsp?id="+rs.getString("gid"));
	
	conn.close();
%>