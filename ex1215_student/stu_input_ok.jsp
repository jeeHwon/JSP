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
	String hakbun = request.getParameter("hakbun");
	String birth = request.getParameter("birth");
	String zip = request.getParameter("zip");
	String juso = request.getParameter("juso");
	String juso_etc = request.getParameter("juso_etc");
	String phone = request.getParameter("phone");
	

	//쿼리 생성
	String sql = "insert into student (name, hakbun, birth, zip, juso, juso_etc, phone, writeday) ";
	sql += " values (?, ?, ?, ?, ?, ?, ?, now())";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, hakbun);
	pstmt.setString(3, birth);
	pstmt.setString(4, zip);
	pstmt.setString(5, juso);
	pstmt.setString(6, juso_etc);
	pstmt.setString(7, phone);
	
	//쿼리 실행
	pstmt.executeUpdate();
	pstmt.close();
	
		//이동하고 싶은 문서
	response.sendRedirect("stu_input.jsp");
	
	conn.close();
%>

<!--  
create table student(
id int auto_increment primary key,
name char(10),
hakbun char(8),
birth date,
zip char(5),
juso varchar(50),
juso_etc varchar(50),
phone char(15),
writeday date
);
-->
