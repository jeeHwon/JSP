<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- 문서 읽을 때 부메뉴는 숨긴다.마우스 주메뉴에 들어가면 보인고 나가면 안보이고. 스크립트로 구현 -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#first {
	width: 800px;
	height: 50px;
	margin: auto;
}

#first #aa>li { /*주메뉴에 대한 스타일 따라서 >로 자식임을 나타내자*/
	list-style-type: none;
	display: inline-block; /*inline을 주면 block형이 가지고 있는 가로, 세로 값 부여불가*/
	border: 1px solid red;
	width: 120px;
	height: 35px;
	text-align: center;
	padding-top: 12px;
	margin-left: 20px;
	position: relative;
}

#first .sub { /*서브 메뉴를 가지는 ul태그*/
	position: absolute;
	border: 1px solid blue;
	width: 120px;
	padding-left: 0px;
	top: 50px;
	visibility:hidden;	/*부 메뉴를 숨겨라*/
}

#first .sub li {
	list-style-type: none;
}
</style>
<script>
	function sub_view(n){	//부 메뉴를 보이게 하는 메서드
		//현재 문서의 모든 부메뉴는 class="sub"로 되어있다 => 동일한 클래스는 배열로 처리
		//수산물 =>sub[0],농산물 =>sub[1], 장난감 =>sub[2],안주류 =>sub[3]
		document.getElementsByClassName("sub")[n].style.visibility="visible"
		
	}
	function sub_hide(n){	//부 메뉴를 숨기는 메서드
		
		document.getElementsByClassName("sub")[n].style.visibility="hidden"
		
	}


</script>

</head>
<body>
	<!-- 메뉴는 모든 태그로 만들수 있지만 주로 div, ul -->
	<!-- li 태그는 block형=>한 행을 차지, inline=> 자기공간만 차지 -->
	<div id="first">
		<ul id="aa">
			<li onmouseenter="sub_view(0)" onmouseleave="sub_hide(0)">수산물
				<ul class="sub">
					<li>돔 류</li>
					<li>조개류</li>
					<li>잡 어</li>
					<li>갑각류</li>
					<li>그 외</li>
				</ul>
			</li>
			<li onmouseenter="sub_view(1)" onmouseleave="sub_hide(1)">농산물
				<ul class="sub">
					<li>쌀</li>
					<li>잡곡류</li>
					<li>과일</li>
					<li>채소</li>
					<li>버섯</li>
				</ul>
			</li>
			<li onmouseenter="sub_view(2)" onmouseleave="sub_hide(2)">장난감
				<ul class="sub">
					<li>자동차</li>
					<li>로보트</li>
					<li>인형</li>
					<li>레고</li>
					<li>피규어</li>
				</ul>
			</li>
			<li onmouseenter="sub_view(3)" onmouseleave="sub_hide(3)">안주류
				<ul class="sub">
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