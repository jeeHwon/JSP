<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn" %>
<%@ page import="java.sql.ResultSet" %>
<%
	//list 메소드를 포함한 클래스 객체 생성
	DB_Conn db = new DB_Conn();
	ResultSet rs = db.list();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="600" align="center">
	<tr>
		<td>이름</td>
		<td>제목</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
	<%while(rs.next()){ %>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><a href="content.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title") %></a></td>
		<td><%=rs.getString("readnum") %></td>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<%} %>
	<tr>
		<td colspan="4" align="center"><a href="write.jsp">글쓰기</a></td>
	</tr>
</table>

</body>
</html>