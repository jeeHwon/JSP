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
		chk.open("get", "target.jsp")
		chk.send()	//서버에 전송 => target.jsp를 get 방식으로 호출
		
		chk.onreadystatechange=function(){	//0~4의 값 4:완료시
			if(chk.readyState==4){
				//alert(chk.responseText)	// 자바소스 제외한 모든 텍스트 가져온다
				if (chk.responseText.trim()=="1"){
					document.getElementById("aa").innerText="가능합니다"
				} else{
					document.getElementById("aa").innerText="불가능합니다"
				}
				
			}
		}	
	}
</script>
</head>
<body>
	<input type="button" onclick="check()" value="호출" >
	<input type="text"><p>
	<span id="aa"></span>
</body>
</html>