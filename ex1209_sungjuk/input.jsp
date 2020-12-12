<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h2>본인의 성적을 입력하세요</h2></div>
	<form method="post" action="input_ok.jsp">
		<table width="600" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="pwd2"></td>
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="text" name="kor"></td>
			</tr>
						<tr>
				<td>영어</td>
				<td><input type="text" name="eng"></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><input type="text" name="mat"></td>
			</tr>
			<tr>
				<td>과학</td>
				<td><input type="text" name="sci"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="성적입력">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>