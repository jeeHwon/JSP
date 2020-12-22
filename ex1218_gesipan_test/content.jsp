<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");

	String sql = "select * from gesipan2 where id=" + id;
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
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
	#del{
		position:absolute;
		visibility:hidden;
	}
</style>
</head>
<body>
	<!-- ResultSet의 내용을 출력-->
	<table width="500" align="center">
		<tr align="center">
			<td>작성자</td>
			<td><%=rs.getString("name")%></td>
			<td>출생연도</td>
			<td><%=rs.getString("year")%></td>
			<td>성별</td>
			<td><%=rs.getString("gender")%></td>
			<td>작성일</td>
			<td><%=rs.getString("writeday")%></td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td colspan="7"><%=rs.getString("title")%></td>
		</tr>
		<tr height="200">
			<td align="center">내용</td>
			<td colspan="7"><%=rs.getString("content")%></td>
		</tr>		
		<tr>
			<td colspan="8" align="center">
				<a href="update.jsp?id=<%=id%>">수정</a>
				<a href="delete.jsp?id=<%=id%>">삭제</a>
				<a href="list.jsp">목록</a>
			</td>
		</tr>
	</table>

</body>
</html>
<%
	stmt.close();
	conn.close();
%>