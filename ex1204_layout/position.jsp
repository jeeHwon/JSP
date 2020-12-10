<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#aa, #bb{
	position:absolute;
	left:100px;
	top:100px;
	background:red;
	width:100px;
	height:100px;
}
#main{
	position:relative;
	witdh:400px;
	height:400px;
	border:1px solid blue;
	margin-left:300px;
}
</style>
</head>
<body>
	<div id="aa"></div>
	<div id="main">
		<div id="bb"></div>
	</div>

</body>
</html>