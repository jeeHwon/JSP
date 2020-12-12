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
	
	//request 값 읽어오기
	String id = request.getParameter("id");
	
	//쿼리 생성
	String sql = "select * from qna where id="+id;
	
	//심부름꾼 생성
	Statement stmt  = conn.createStatement();
	
	//쿼리 실행 => ResultSet 저장
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center" width="600">
		<tr>
			<td>이름</td>
			<td><%=rs.getString("name")%></td>
			<td>작성일</td>
			<td><%=rs.getString("writeday")%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><%=rs.getString("content")%></td>
		</tr>
		<tr>
			<td colspan="4">
				수정
				삭제
				<a href="list.jsp">목록</a>
				<a href="rewrite.jsp?grp=<%=rs.getInt("grp")%>&seq=<%=rs.getInt("seq")%>&depth=<%=rs.getInt("depth")%>">답글쓰기</a>
			</td>
		</tr>
	</table>

</body>
</html>