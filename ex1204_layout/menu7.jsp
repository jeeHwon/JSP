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
		alert("�̹��� ������ �Լ�")
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
				<h1>�ټ��հ��� �ȿ� ��� ��ȭ</h1>
			</div>
		</div>
	</header>
	<div class="main_container">
		<ul>
			<li class="main" onclick="sub_view(0)">�ѱ���ȭ Top 5</li>
			<li class="sub">
				<ul>
					<li onclick="show_img()">�õ庸��</li>
					<li>����</li>
					<li>�������°�׶���Ʋ����</li>
					<li>�������λ�</li>
					<li>�������߾�</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(1)">�̱���ȭ Top 5</li>
			<li class="sub">
				<ul>
					<li>��ƼǮ���ε�</li>
					<li>�۷�������</li>
					<li>1917</li>
					<li>�ٽ�����</li>
					<li>ų��</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(2)">�Ϻ���ȭ Top 5</li>
			<li class="sub">
				<ul>
					<li>����,ȣ���� �׸��� ������</li>
					<li>�ƻ���</li>
					<li>�����⵿��</li>
					<li>����������</li>
					<li>õ���Ǽ���ǻŸ</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(3)">�ִϸ��̼ǿ�ȭ Top 5</li>
			<li class="sub">
				<ul>
					<li>���̽��丮</li>
					<li>������Ʈ</li>
					<li>�̳�;߼�</li>
					<li>�����Ǿ�</li>
					<li>�ϸ�ã�Ƽ�</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(4)">�ڹ̵�ȭ Top 5</li>
			<li class="sub">
				<ul>
					<li>�达ǥ����</li>
					<li>������</li>
					<li>�����</li>
					<li>�ѷ��ڽ���</li>
					<li>�ҷ�����</li>
				</ul>
			</li>
		</ul>

	</div>
	<div class="img_container">
		<img source="">
	</div>


</body>
</html>