<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3307/jee";
	String user = "root";
	String password = "1234";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	String id = request.getParameter("id");
	
	String sql = "select * from gesipan2 where id="+ id;
	
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
	#btn{
		width:150px;
		height:40px;
		border:1px solid #f15657;
		background:#f15657;
		color:white;
	}
</style>
</head>
<body>
	<form method="post" action="update_ok.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<table width="600" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=rs.getString("title")%>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>		
			<tr>
				<td>태어난해</td>
				<td>
					<select name="year">
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
					</select>
				</td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea col="40" rows="5" name="content"><%=rs.getString("content")%></textarea></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="0">남
					<input type="radio" name="gender" value="1">여
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id="btn">수정하기</button>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>
<%
	stmt.close();
	conn.close();
%>