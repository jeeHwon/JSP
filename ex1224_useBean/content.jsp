<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn" %>    
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="jspPJ.dto.BoardDto" %> 
<%
   	//requset값 가져오기
   	String id = request.getParameter("id");

   	//DB_Conn 클래스에서 content() 실행
   	DB_Conn db = new DB_Conn();
   	BoardDto bdto = db.content(id);
   	
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="600" align="center" border="1px solid black">
		<tr>
			<td>제목</td>
			<td><%=bdto.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=bdto.getName()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=bdto.getContent()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=bdto.getReadnum()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=bdto.getWriteday()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="list.jsp">목록</a>
				<a href="update.jsp?id=<%=id%>">수정</a>
				<a href="delete.jsp?id=<%=id%>">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>