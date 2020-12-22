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
	String hakbun = request.getParameter("hakbun");
	String birth = request.getParameter("birth");
	String zip = request.getParameter("zip");
	String juso = request.getParameter("juso");
	String juso_etc = request.getParameter("juso_etc");
	String phone = request.getParameter("phone");
	

	//쿼리생성
	String sql = "update student set name=?, hakbun=?, birth=?, zip=?, juso=?, juso_etc=?, phone=? where id=?";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, hakbun);
	pstmt.setString(3, birth);
	pstmt.setString(4, zip);
	pstmt.setString(5, juso);
	pstmt.setString(6, juso_etc);
	pstmt.setString(7, phone);
	pstmt.setString(8, id);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//페이지 이동
	response.sendRedirect("stu_list.jsp");
	pstmt.close();

	conn.close();
%>