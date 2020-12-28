<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	function check(){
		$.ajax({
			type:"get",
			url:"target.jsp",
			success:function(data){
				$("#aa").text(data)
			}
		})
	}
</script>
</head>
<body>
	<input type="button" onclick="check()" value="호출" >
	<input type="text"><p>
	<span id="aa"></span>
</body>
</html>