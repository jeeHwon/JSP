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
	display:inline-block;		/*inline을 주면 block형이 가지고 있는 가로, 세로 값 부여불가*/
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
	<!-- 메뉴는 모든 태그로 만들수 있지만 주로 div, ul -->
	<!-- li 태그는 block형=>한 행을 차지, inline=> 자기공간만 차지 -->
	<ul id="aa">
		<li>수산물</li>
		<li>농산물</li>
		<li>장난감</li>
		<li>안주류</li>
		<li>축산물</li>
	</ul>
	<hr>
	<ul id="bb">
		<li>수산물</li>
		<li>농산물</li>
		<li>장난감</li>
		<li>안주류</li>
		<li>축산물</li>
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