<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#aa li{
	list-style-type:none;
	display:inline-block;		/*inline�� �ָ� block���� ������ �ִ� ����, ���� �� �ο��Ұ�*/
	border:1px solid red;
	width:120px;
	height:35px;
	text-align:center;
	padding-top:12px;
	margin-left:20px;

}
#bb li{
	list-style-type:none;
	float:left;

}

</style>


</head>
<body>
	<!-- �޴��� ��� �±׷� ����� ������ �ַ� div, ul -->
	<!-- li �±״� block��=>�� ���� ����, inline=> �ڱ������ ���� -->
	<ul id="aa">
		<li>���깰</li>
		<li>��깰</li>
		<li>�峭��</li>
		<li>���ַ�</li>
		<li>��깰</li>
	</ul>
	<hr>
	<ul id="bb">
		<li>���깰</li>
		<li>��깰</li>
		<li>�峭��</li>
		<li>���ַ�</li>
		<li>��깰</li>
	</ul>
	
	
	
	
	
	
	<!--  
	<hr>
	<h1>h1</h1>
	<h2>h2</h2>
	<span>span</span>
	<a>a</a>
	<b>b</b>
	<div>div</div>
	-->
</body>
</html>