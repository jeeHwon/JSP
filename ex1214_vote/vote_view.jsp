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
	
	//쿼리 생성
	String sql = "select a1,a2,a3,a4,a5,a6,a7,(a1+a2+a3+a4+a5+a6+a7) as hap from vote where id=1 ";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	
	//쿼리 실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	//투표의 결과를 확인하기 위한 값
	double hap = rs.getDouble("hap");
	int a1 = (int)(rs.getInt("a1")/hap * 100);
	int a2 = (int)(rs.getInt("a2")/hap * 100);
	int a3 = (int)(rs.getInt("a3")/hap * 100);
	int a4 = (int)(rs.getInt("a4")/hap * 100);
	int a5 = (int)(rs.getInt("a5")/hap * 100);
	int a6 = (int)(rs.getInt("a6")/hap * 100);
	int a7 = (int)(rs.getInt("a7")/hap * 100);

	//화면에 나타날 때 => 막대그래프 크기가 투표수에 따라 달라지게..
			
	stmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.anju{
		height:10px;
		background:red;
		display:inline-block;
	}
</style>
</head>
<body>
<table width="500" align="center">
	<tr>
		<td>대방어</td>
		<td><span class="anju" style="width:<%=a1*5%>px"></span></td>
		<td><%=a1%>%</td>
	</tr>
	<tr>
		<td>돌돔</td>
		<td><span class="anju" style="width:<%=a2*5%>px"></span></td>
		<td><%=a2%>%</td>
	</tr>
	<tr>
		<td>감성돔</td>
		<td><span class="anju" style="width:<%=a3*5%>px"></span></td>
		<td><%=a3%>%</td>
	</tr>
	<tr>
		<td>참돔</td>
		<td><span class="anju" style="width:<%=a4*5%>px"></span></td>
		<td><%=a4%>%</td>
	</tr>
	<tr>
		<td>벵애돔</td>
		<td><span class="anju" style="width:<%=a5*5%>px"></span></td>
		<td><%=a5%>%</td>
	</tr>
	<tr>
		<td>자리돔</td>
		<td><span class="anju" style="width:<%=a6*5%>px"></span></td>
		<td><%=a6%>%</td>
	</tr>
	<tr>
		<td>옥돔</td>
		<td><span class="anju" style="width:<%=a7*5%>px"></span></td>
		<td><%=a7%>%</td>
	</tr>
</table>
	<div>
		<a href="vote.jsp">또 투표하기</a>
	</div>

</body>
</html>













