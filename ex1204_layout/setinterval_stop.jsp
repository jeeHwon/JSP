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
	
	
	function start(){	//left ���� 500px �Ǹ� ���߰� �ʹ� => clearInterval(��ü��)
		s1 = setInterval(move,10)	//�ٸ� �Լ����� s1 ����� ��� var ����!(���������� ���)
		
	}
</script>
</head>
<body>
	<input type="button" onclick="move()" value='Ŭ��'>
	<input type="button" onclick="start()" value='�ڵ��̵�'>
	<div id="layer">�����Դϴ�</div>

</body>
</html>