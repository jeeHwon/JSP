<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	margin: 0px;
}

#first {
	width: 100%;
	height: 50px;
	background: crimson;
	margin: auto;
	color: white;
}

#first #inner {
	width: 1200px;
	height: 50px;
	margin: auto;
}

#first #left {
	width: 1180px;
	height: 50px;
	float: left;
	text-align: center;
	padding-top: 10px;
}

#second {
	width: 1200px;
	height: 50px;
	margin: auto;
	text-align: center;
}

#second #title {
	padding-top: 25px;
}

li {
	list-style-type: none;
}

.main_container {
	position: relative;
	width: 1200px;
	top: 100px;
}

.main {
	color: white;
	font-weight: 800;
	width: 200px;
	height: 30px;
	border: 1px solid black;
	border-radius: 20px;
	text-align: center;
	padding-top: 8px;
	background: crimson;
}

.sub {
	display: none;
}

.sub ul {
	padding-left: 20px;
}

.sub ul li {
	margin-top: 10px;
	color:crimson;
}

.sub ul li:hover {
	font-weight: 900;
}

.img_container {
	position: absolute;
	border: 1px solid black;
	width: 500px;
	height: 500px;
	top: 200px;
	left: 350px;
}
</style>
<script>
	function sub_view(n) {
		for (i = 0; i < 5; i++) {
			document.getElementsByClassName("sub")[i].style.display = "none"
		}
		document.getElementsByClassName("sub")[n].style.display = "block"
	}
	function show_img() {
		alert("이미지 나오는 함수")
	}
</script>

</head>
<body>
	<header>
		<div id="first">
			<div id="inner">
				<div id="left"></div>
			</div>
		</div>
		<div id="second">
			<div id="title">
				<h1>다섯손가락 안에 드는 영화</h1>
			</div>
		</div>
	</header>
	<div class="main_container">
		<ul>
			<li class="main" onclick="sub_view(0)">한국영화 Top 5</li>
			<li class="sub">
				<ul>
					<li onclick="show_img()">올드보이</li>
					<li>빈집</li>
					<li>지금은맞고그때는틀리다</li>
					<li>달콤한인생</li>
					<li>살인의추억</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(1)">미국영화 Top 5</li>
			<li class="sub">
				<ul>
					<li>뷰티풀마인드</li>
					<li>글래디에이터</li>
					<li>1917</li>
					<li>바스터즈</li>
					<li>킬빌</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(2)">일본영화 Top 5</li>
			<li class="sub">
				<ul>
					<li>조제,호랑이 그리고 물고기들</li>
					<li>아사코</li>
					<li>공각기동대</li>
					<li>모노노케히메</li>
					<li>천공의성라퓨타</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(3)">애니메이션영화 Top 5</li>
			<li class="sub">
				<ul>
					<li>토이스토리</li>
					<li>러빙빈센트</li>
					<li>미녀와야수</li>
					<li>주토피아</li>
					<li>니모를찾아서</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(4)">코미디영화 Top 5</li>
			<li class="sub">
				<ul>
					<li>김씨표류기</li>
					<li>족구왕</li>
					<li>행오버</li>
					<li>롤러코스터</li>
					<li>불량남녀</li>
				</ul>
			</li>
		</ul>

	</div>
	<div class="img_container">
		<img source="">
	</div>


</body>
</html>