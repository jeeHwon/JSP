<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<style>
#section{width:1100px; height:500px ;margin:auto; text-align:center;}
#form_box{width:400px; height:300px; margin:auto; margin-top:100px;}
#form_box input{width:300px; height:40px; border:1px solid #5D9CEC; margin-top:20px;}
#form_box input[type=submit]{width:305px; height:40px;color:white; background:#5D9CEC;}
#form_box #etc{margin-top:20px;}

</style>
<div id="section">
<div id="form_box">
	<form method="post" action="login_ok.jsp">
		<div id="userid"><input type="text" name="userid" placeholder="아이디"></div>
		<div id="pwd"><input type="text" name="pwd" placeholder="비밀번호"></div>
		<div id="submit"><input type="submit" value="로그인"></div>
		<div id="etc">아이디찾기 / 비밀번호찾기 / <a href="member.jsp">회원가입</a></div>
	</form>
</div>
</div>

<%@ include file="../bottom.jsp" %> 