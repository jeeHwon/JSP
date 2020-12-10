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
<script>	// letf 값을 변경 => 이동, width, height 변경
	var n = 10
	var w = 200
	function move(){
		n += 5
		w += 5
		document.getElementById("layer").style.left=n+"px"
		document.getElementById("layer").style.width=w+"px"
		document.getElementById("layer").style.height=w+"px"
		if(n>=800) clearInterval(s1)
	}
	
	function start(){
		s1 = setInterval(move,10)
		
	}
</script>
</head>
<body>
	<input type="button" onclick="move()" value='클릭'>
	<input type="button" onclick="start()" value='자동이동'>
	<div id="layer">광고입니다</div>

</body>
</html>