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
<script>	// letf ���� ���� => �̵�, width, height ����
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
	<input type="button" onclick="move()" value='Ŭ��'>
	<input type="button" onclick="start()" value='�ڵ��̵�'>
	<div id="layer">�����Դϴ�</div>

</body>
</html>