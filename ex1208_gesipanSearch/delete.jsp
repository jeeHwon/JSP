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
	String pager = request.getParameter("pager");
	String cla = request.getParameter("cla");
	String sword = request.getParameter("sword");
	
	//DB에 있는 비밀번호 가져오기
	String sql = "select pwd from gesipan where id="+id;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//입력비밀번호와 비교
	if(pwd.equals(rs.getString("pwd"))) {
		//쿼리 생성
		sql = "delete from gesipan where id="+id;
		
		//심부름꾼
		stmt = conn.createStatement();
		
		//쿼리실행 => ResultSet
		stmt.executeUpdate(sql);
		
		//이동
		response.sendRedirect("list.jsp?pager="+pager+"&cla="+cla+"&sword="+sword);
	} else{
		response.sendRedirect("content.jsp?id="+id+"&pager="+pager+"&cla="+cla+"&sword="+sword+"&chk=1");
	}
	
	stmt.close();
	conn.close();
%>