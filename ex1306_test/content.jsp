<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%
   	//requset값 가져오기
   	String id = request.getParameter("id");

	BoardDao bdao = new BoardDao();
   	BoardDto bdto = bdao.content(id);
   	
   	pageContext.setAttribute("bdto", bdto);
   	
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
<script>
	function view_del(){
		var x = event.clientX
		var y = event.clientY
		document.getElementById("del").style.visibility="visible"
		document.getElementById("del").style.left=(x-30)+"px"
		document.getElementById("del").style.top=(y+30)+"px"
	}
</script>
</head>
<body>
	<table width="600" align="center" border="1px solid black">
		<tr>
			<td>제목</td>
			<td>${bdto.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${bdto.name}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${bdto.content}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${bdto.readnum}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${bdto.writeday}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="list.jsp">목록</a>
				<a href="update.jsp?id=<%=id%>">수정</a>
				<a href="#" onclick="view_del()">삭제</a>
			</td>
		</tr>
			<%if(request.getParameter("chk") != null){ %>		
			<tr>
				<td colspan="2" align="center">비밀번호가 틀렸습니다</td>
			</tr>
			<%} %>
	</table>
		<form method="post" action="delete.jsp" id="del">
		<input type="hidden" name="id" value="<%=id%>">
		비밀번호<input type="password" name="pwd" size="4">
		<input type="submit" value="삭제">
	</form>
</body>
</html>