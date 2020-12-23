<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="write_ok.jsp">
		<table width="600" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea col="40" rows="5" name="content"></textarea></td>
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