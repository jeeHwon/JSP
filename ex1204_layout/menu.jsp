<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
ul {
	position: absolute;
	left: 10px;
	top: 40px;
	visibility: hidden;
}

#first {
	width: 800px;
	height: 30px;
	margin: auto;
	position: relative
}
</style>
<script>
	function view() {
		document.getElementById("sub").style.visibility = "visible"

	}

	function hide() {
		document.getElementById("sub").style.visibility = "hidden"

	}
</script>

</head>
<body>
	<div id="first" onmouseenter="view()" onmouseleave="hide()">���깰
		<ul id="sub">
			<li>����</li>
			<li>���</li>
			<li>���</li>
			<li>�췰</li>
		</ul>
	</div>


</body>
</html>