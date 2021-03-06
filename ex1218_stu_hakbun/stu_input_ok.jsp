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
	String birth = request.getParameter("birth");
	String zip = request.getParameter("zip");
	String juso = request.getParameter("juso");
	String juso_etc = request.getParameter("juso_etc");
	String phone = request.getParameter("phone");
	String year = request.getParameter("year");
	String ban = request.getParameter("ban");
	
	//학번 부여하기
	//String hakbun = request.getParameter("hakbun");
	String hakbun = "s" + year + ban;	//'s0301'
	String sql2 = "select ifnull(max(substring(hakbun, 6, 2)), 0) "; 
	sql2 += "as bun from student where hakbun like '" + hakbun + "%' ";
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql2);
	rs.next();
	Integer bun = rs.getInt("bun");
	bun++; //값은 1~99 => 한자리일 경우 앞에 0을 붙여야한다.
	if(bun<10){
		hakbun = hakbun + "0" + bun;
	} else{
		hakbun = hakbun + bun;
	}
	
	
	

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
	response.sendRedirect("stu_list.jsp");
	
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
