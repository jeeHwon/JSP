<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 질문글을 만드는 폼으로 grp, seq, depth가 필요없음 -->
	<form name="frm" method="post" action="write_ok.jsp">
		<table align="center" width="title">
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
				<td colspan="2" align="center"><input type="submit" value="질문저장"></td>
			</tr>
		</table>
	</form>
</body>
</html>
<!-- 

--qna 테이블

create table qna(
id int auto_increment primary key,
title varchar(100),
name varchar(10),
content text,
pwd char(10),
grp int,
seq int default 1,
depth int default 1,
writeday date
);




 -->