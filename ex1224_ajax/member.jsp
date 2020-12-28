<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var chk = new XMLHttpRequest() //객체 생성
	
	//사용자의 이벤트가 실행되었을 때 => background에서 서버에 다녀오는 것 (jsp문서호출)
	function check(){
		//자바스크립트에서 userid 값을 가져와 id_check로 보내야한다
		var userid = document.frm.userid.value
		chk.open("get", "id_check.jsp?userid="+userid)
		chk.send()	//서버에 전송 => target.jsp를 get 방식으로 호출
		
		chk.onreadystatechange=function(){	//0~4의 값 4:완료시
			if(chk.readyState==4){
				if (chk.responseText.trim()=="0"){
					document.getElementById("aa").innerHTML="<span style='color:green'>사용가능한 아이디</span>"
				} else{
					document.getElementById("aa").innerHTML="<span style='color:red'>이미 있는 아이디</span>"
				}
			}
		}	
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

