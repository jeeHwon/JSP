<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	String sql = "select * from gesipan2 order by id desc";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{
		border:1px solid #cccccc;
	}
</style>
</head>
<body>
	<table width="600" align="center">
		<tr align="center">
			<td>작성자</td>
			<td>제목</td>
			<td>성별</td>
			<td>태어난해</td>
			<td>작성일</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td align="center"><%=rs.getString("name")%></td>
			<td align="center"><a href="content.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title")%></a></td>
			<td align="center"><%=rs.getString("gender")%></td>
			<td align="center"><%=rs.getString("year")%></td>
			<td align="center"><%=rs.getString("writeday")%></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5" align="center"><a href="write.jsp">글쓰기</a></td>
		</tr>
	</table>
</body>
</html>
