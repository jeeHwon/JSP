<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#out{
		width:300px;
		height:120px;
		overflow:hidden;
		border:2px solid black;
	}
	#in{
		width:2400px;
		height:120px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		setInterval(function(){
			$("#in").animate({
				marginLeft:"-300px"
			}, 2000, function(){
				$("img").eq(0).insertAfter($("img").eq(3))
				$("#in").css("marginLeft", "0px")
			})
		},4000)
	})
</script>
</head>
<body>
	<div id="out">
		<div id="in">
			<img src="a1.jpg" width="300" height="120"><img src="a2.jpg" width="300" height="120"><img src="a3.jpg" width="300" height="120"><img src="a4.jpg" width="300" height="120">
		</div>
	</div>
</body>
</html>