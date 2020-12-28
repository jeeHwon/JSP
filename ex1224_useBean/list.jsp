<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jspPJ.dto.BoardDto" %>
<%
	//list 메소드를 포함한 클래스 객체 생성
	DB_Conn db = new DB_Conn();
	ArrayList<BoardDto> list = db.list();
	//out.print(list.size());
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
	<%for(int i=0; i<list.size(); i++){%>
	<tr>
		<td><%=list.get(i).getName() %></td>
		<td><a href="content.jsp?id=<%=list.get(i).getId()%>"><%=list.get(i).getTitle() %></a></td>
		<td><%=list.get(i).getReadnum() %></td>
		<td><%=list.get(i).getWriteday() %></td>
	</tr>
	<%} 
		db.conn_close();
	%>
	<tr>
		<td colspan="4" align="center"><a href="write.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>