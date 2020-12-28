<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspPJ.DB_Conn"%>
<%@ page import="java.sql.*" %>
<%@ page import="jspPJ.dto.BoardDto" %> 
<%
	//DB 연결 - DB_Conn.java통해 Connection 객체 생성
	DB_Conn db = new DB_Conn();

	//requset값 가져오기
	String id = request.getParameter("id");
	
   	BoardDto bdto = db.content(id);
   	pageContext.setAttribute("bdto", bdto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="update_ok.jsp">
		<input type="hidden" name="id" value="<%=id%>" >
		<table width="600" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${bdto.title}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" value="${bdto.name}"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea col="40" rows="5" name="content">${bdto.content}</textarea></td>
			</tr>		
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>		
	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장">
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>