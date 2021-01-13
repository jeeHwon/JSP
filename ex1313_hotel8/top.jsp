<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	margin:0px;
}
#first{	/* 광고 관련 1층*/
	width:1100px;
	height:30px;
	margin:auto;
	background:#5D9CEC;
	text-align:center;
	padding-top:10px;
}
#second{/* 로고, 메뉴 2층*/
	width:1100px;
	height:60px;
	margin:auto;
}
#second #left{
	padding-top:15px;
	width:200px;
	float:left;
}
#second #right{
	padding-top:15px;
	width:900px;
	float:right;
	text-align:right;
}
#second #right #menu{
	display:inline-block;
	width:100px;
	height:50px;
	position:relative;
}
#second #right #menu .sub{
	position:absolute;
	width:120px;
	left:0px;
	top:10px;
	background:white;
	padding-left:0px;
	padding-top:10px;
	visibility:hidden;
}
#second #right #menu .sub li {
	list-style-type:none;
	text-align:center;
}

#fifth{/* 팬션소개 5층*/
	width:1100px;
	height:40px;
	margin:auto;
}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	function view_sub(n){
		document.getElementsByClassName("sub")[n].style.visibility="visible"
	}
	function hide_sub(n){
		document.getElementsByClassName("sub")[n].style.visibility="hidden"
	}
	/* 	
	var h = 30	//id first 의 height
	var p = 10	//id first 의 padding-top
	function first_close(){
		h--
		document.getElementById("first").style.height = h + "px"
		if(h>0) {
			setTimeout(first_close, 10)
		} else{
			p--
			document.getElementById("first").style.paddingTop = p+"px"
			if(p>0){
				setTimeout(first_close, 10)
			} else{
				document.getElementById("first").style.display="none"
			}
		}
	} 
	*/
	
	/* 위 식을 간단히  */
    $(function()
    	    {
    	    	$("#ff").click(function()
    	    	{
    	    		$("#first").slideUp();
    	    		
    	    	});
    	    });
	
</script>
</head>
<body>
	<div id="first">
		지금 당장 가입해라
		<span id="ff" style="cursor:pointer" onclick="first_close()">X</span>
	</div>
	<div id="second">
		<div id="left"><a href="../main/index.jsp">The Jee Hotels & Resorts</a></div>
		<div id="right">
			<span id="menu" onmouseenter="view_sub(0)" onmouseleave="hide_sub(0)">호텔찾기
				<ul class="sub">
					<li>권역별</li>
					<li>브랜드별</li>
					<li>해외</li>
				</ul>
			</span>			
			<span id="menu" onmouseenter="view_sub(1)" onmouseleave="hide_sub(1)">예약
				<ul class="sub">
					<li>호텔선택</li>
					<li><a href="../reserve/reserve.jsp">날짜선택</a></li>
					<li>인원선택</li>
				</ul>
			</span>			
			<span id="menu" onmouseenter="view_sub(2)" onmouseleave="hide_sub(2)">소개
				<ul class="sub">
					<li><a href="../sogae/sogae.jsp">호텔소개</a></li>
					<li>수상이력</li>
					<li>서울/제주호텔</li>
				</ul>	
			</span>		
			<span id="menu" onmouseenter="view_sub(3)" onmouseleave="hide_sub(3)">고객문의
				<ul class="sub">
					<li>연락처</li>
					<li>문의하기</li>
					<li>자주묻는질문</li>
				</ul>
			</span>
			<span id="menu" onmouseenter="view_sub(4)" onmouseleave="hide_sub(4)">리워즈
				<ul class="sub">
					<li>회원특전</li>
					<li>포인트안내</li>
					<li>프로모션</li>
				</ul>			
			</span>
		</div>
	</div>