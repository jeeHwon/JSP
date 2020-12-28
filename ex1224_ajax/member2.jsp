<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	function check(){
		$.ajax({
			type:"get",
			url:"id_check.jsp",
			data:{userid:document.frm.userid.value},
			success:function(data){
				if(data==0)
					$("#aa").text("사용가능한 아이디")
				else
					$("#aa").text("이미 있는 아이디")
			}
		})
	}
</script>
</head>
<body>
<!-- 회원가입폼 -->
<form name="frm">
	아이디<input type="text" name="userid"><input type="button" onclick="check()" value="중복확인">
	<span id="aa"></span><p>
	이름<input type="text" name="nick"><p>
	비밀번호<input type="text" name="pwd"><p>
	<input type="submit" value="회원가입">
</form>
</body>
</html>