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
	<input type="button" onclick="move()" value='Ŭ��'>
	<input type="button" onclick="start()" value='�ڵ��̵�'>
	<div id="layer">�����Դϴ�</div>

</body>
</html>