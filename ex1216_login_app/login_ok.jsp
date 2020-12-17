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
	
	//사용자 아이디, 비번을 request
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	//쿼리작성
	String sql = "select * from member2 where userid='"+userid+"' and pwd='"+pwd+"' ";	
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	//실행결과(1.레코드가 비었거나, 2.레코드가 존재하거나)
	if(rs.next()){	//아이디 그리고 비번 동일
		//세션변수를 부여(회원만 열람 가능한 문서를 볼수 있게)
		session.setAttribute("userid", rs.getString("userid"));	//("useritd", userid)
		
		//어플리케이션 변수에 방금 로그인한 사용자 아이디 추가(누적)
		String temp = application.getAttribute("name").toString();
		temp += ", "+rs.getString("userid");
		application.setAttribute("name", temp);
		//메인페이지(index.jsp)
		response.sendRedirect("index.jsp");
	} else{		//아이디 또는 비번 틀림
		
		//login.jsp로 이동하여 다시 로그인
		response.sendRedirect("login.jsp?chk=1");
	}
%>