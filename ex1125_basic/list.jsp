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
	String sql = "select * from member";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>이름</td>
			<td>나이</td>
			<td>주소</td>
			<td>삭제</td>
			<td>수정</td>
		</tr>
		<%while(rs.next()){%>
			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("age")%></td>
				<td><%=rs.getString("juso")%></td>
				<td><a href="delete.jsp?id=<%=rs.getString("id")%>">클릭</a></td>
				<td><a href="update.jsp?id=<%=rs.getString("id")%>">클릭</a></td>
			</tr>
		<%} %>
		<tr>
			<td colspan="3" align="center"><a href="write.jsp">글쓰기</a></td>
		</tr>
	</table>

</body>
</html>