<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	//setTimeout, setInterval => 특정시간후에 기능(함수)를 호출하는 메소드
	function show(){
		alert("안녕하세요")
	}
	function win_open(){
		window.open("","","width=100, height=100")
	}
	//setTimeout(show, 3000)	//setTimeout(함수, 시간) => 시간후에 함수를 1번 실행하라
	//setInterval(show, 3000)	//setInterval(함수, 시간)=> 시간후에 함수를 실행하라(무한반복)
	setIn/terval(win_open, 3000)
</script>
</head>
<body>


</body>
</html>