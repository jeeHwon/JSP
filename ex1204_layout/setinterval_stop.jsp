<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#layer{
	position:absolute;
	left:10px;
	top:100px;
	background:yellow;
	width:200px;
	height:200px;
	border:1px solid red;
}

</style>
<script>
	var n = 10
	function move(){
		n += 10
		document.getElementById("layer").style.left=n+"px"
		if(n>=500) clearInterval(s1)
	}
	
	
	function start(){	//left 값이 500px 되면 멈추고 싶다 => clearInterval(객체명)
		s1 = setInterval(move,10)	//다른 함수에서 s1 사용할 경우 var 생략!(전역변수로 사용)
		
	}
</script>
</head>
<body>
	<input type="button" onclick="move()" value='클릭'>
	<input type="button" onclick="start()" value='자동이동'>
	<div id="layer">광고입니다</div>

</body>
</html>