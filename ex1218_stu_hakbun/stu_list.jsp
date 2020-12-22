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
	String sql = "select * from student ";
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리 실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<!-- 레코드 내용 출력 -->
	<div align="center">
		<table width="600">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>전화번호</td>
				<td>수정</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("hakbun")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("birth")%></td>
				<td><%=rs.getString("phone")%></td>
				<td><a href="stu_update.jsp?id=<%=rs.getInt("id")%>"><input type="button" value="수정하기"></a></td>
			</tr>
			<%
			}
		%>
		</table>
		<a href="stu_input.jsp">성적 추가입력하기</a>
	</div>
</body>
</html>