<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#login{
		width:470px;
		height:190px;
		margin:auto;
		margin-top:150px;
		border:1px solid #bbbbbb;
		padding-top:30px;
		padding-left:100px;
	}
	#login input{
		width:350px;
		height:40px;
		border:1px solid purple;
		font-sieze:20px;
	}
	#login #submit{
		width:355px;
		height:43px;
	}
	#pwerr{
		color:red;
	}
</style>
</head>
<body>
	<div id="login">
		<form method="post" action="login_ok.jsp">
			<input type="text" name="userid" placeholder="아이디"><p>
			<input type="password" name="pwd" placeholder="비밀번호"><p>
			<%if(request.getParameter("chk") != null){ %>
			<div>
				<span colspan="6" align="center" id="pwerr">아이디 또는 비밀번호를 확인하세요</span>
			</div>
			<%} %>
			<input type="submit" value="로그인" id="submit"><p>
		</form>
	</div>
</body>
</html>