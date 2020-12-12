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

	//request 값 읽어오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pager = request.getParameter("pager");
	String cla = request.getParameter("cla");
	String sword = request.getParameter("sword");
	
	//입력할 값 가져오기
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	String sung = request.getParameter("sung");
	String hobby = String.join("," , request.getParameterValues("hobby"));
	String birth = request.getParameter("birth");
	
	//DB에 있는 비밀번호 가져오기
	String sql = "select pwd from gesipan where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//입력비밀번호와 비교
	if(pwd.equals(rs.getString("pwd"))) {
		//쿼리 생성
		sql = "update gesipan set title=?, name=?, content=?, sung=?, hobby=?, birth=? "; 
		sql += " where id=?";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, name);
		pstmt.setString(3, content);
		pstmt.setString(4, sung);
		pstmt.setString(5, hobby);
		pstmt.setString(6, birth);
		pstmt.setString(7, id);
		
		//쿼리 실행
		pstmt.executeUpdate();
		
		pstmt.close();
		//이동하고 싶은 문서
		response.sendRedirect("content.jsp?id="+id+"&pager="+pager+"&cla="+cla+"&sword="+sword);
	} else{
		response.sendRedirect("update.jsp?id="+id);
	}
	conn.close();
%>