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
}

</style>
<script>
	var n = 10
	function move(){
		n += 10
		document.getElementById("layer").style.left=n+"px"
	}
	
	
	function start(){
		setInterval(move,10)
		
	}
</script>
</head>
<body>
	<input type="button" onclick="move()" value='클릭'>
	<input type="button" onclick="start()" value='자동이동'>
	<div id="layer">광고입니다</div>

</body>
</html>