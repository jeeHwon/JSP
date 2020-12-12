<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 답글을 만드는 폼으로 grp, seq, depth를 받아서 ok에 전송 -->
	<form name="frm" method="post" action="rewrite_ok.jsp">
		<input type="hidden" name="grp" value="<%=request.getParameter("grp")%>">
		<input type="hidden" name="seq" value="<%=request.getParameter("seq")%>">
		<input type="hidden" name="depth" value="<%=request.getParameter("depth")%>">
		<table align="center" width="600">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="40" rows="4" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="답글저장"></td>
			</tr>
		</table>
	</form>
</body>
</html>