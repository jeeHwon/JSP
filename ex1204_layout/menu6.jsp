<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

li{
	list-style-type:none;
}
.main{
	width:100px;
	height:30px;
	border:1px solid black;
	text-align:center;
	padding-top:8px;
}
.sub{
	display:none;
}
.sub ul{
	padding-left:20px;
}
</style>
<script>
	function sub_view(n){
		//모든 부메뉴를 전부 숨기기
		for(i=0; i<4; i++){
			document.getElementsByClassName("sub")[i].style.display="none"	
		}
		//선택된 부메뉴를 보이기
		document.getElementsByClassName("sub")[n].style.display="block"
		
	}
</script>

</head>
<body>
	<div>
		<ul>
			<li class="main" onclick="sub_view(0)">수산물</li>
			<li class="sub">
				<ul>
					<li>돔 류</li>
					<li>조개류</li>
					<li>잡 어</li>
					<li>갑각류</li>
					<li>그 외</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(1)">농산물</li>
			<li class="sub">
				<ul>
					<li>쌀</li>
					<li>잡곡류</li>
					<li>과일</li>
					<li>채소</li>
					<li>버섯</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(2)">장난감</li>
			<li class="sub">
				<ul>
					<li>자동차</li>
					<li>로보트</li>
					<li>인형</li>
					<li>레고</li>
					<li>피규어</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(3)">안주류</li>
			<li class="sub">
				<ul>
					<li>오징어</li>
					<li>땅콩</li>
					<li>계란말이</li>
					<li>두부김치</li>
					<li>노가리</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(4)">안주류</li>
			<li class="sub">
				<ul>
					<li>오징어</li>
					<li>땅콩</li>
					<li>계란말이</li>
					<li>두부김치</li>
					<li>노가리</li>
				</ul>
			</li>
		</ul>
	</div>

</body>
</html>