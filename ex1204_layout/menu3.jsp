<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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

#first #aa>li { /*�ָ޴��� ���� ��Ÿ�� ���� >�� �ڽ����� ��Ÿ����*/
	list-style-type: none;
	display: inline-block; /*inline�� �ָ� block���� ������ �ִ� ����, ���� �� �ο��Ұ�*/
	border: 1px solid red;
	width: 120px;
	height: 35px;
	text-align: center;
	padding-top: 12px;
	margin-left: 20px;
	position: relative;
}

#first .sub { /*���� �޴��� ������ ul�±�*/
	position: absolute;
	border: 1px solid blue;
	width: 120px;
	padding-left: 0px;
	top: 50px;
}

#first .sub li {
	list-style-type: none;
}
</style>


</head>
<body>
	<!-- �޴��� ��� �±׷� ����� ������ �ַ� div, ul -->
	<!-- li �±״� block��=>�� ���� ����, inline=> �ڱ������ ���� -->
	<div id="first">
		<ul id="aa">
			<li>���깰
				<ul class="sub">
					<li>�� ��</li>
					<li>������</li>
					<li>�� ��</li>
					<li>������</li>
					<li>�� ��</li>
				</ul>
			</li>
			<li>��깰
				<ul class="sub">
					<li>��</li>
					<li>����</li>
					<li>����</li>
					<li>ä��</li>
					<li>����</li>
				</ul>
			</li>
			<li>�峭��
				<ul class="sub">
					<li>�ڵ���</li>
					<li>�κ�Ʈ</li>
					<li>����</li>
					<li>����</li>
					<li>�ǱԾ�</li>
				</ul>
			</li>
			<li>���ַ�
				<ul class="sub">
					<li>��¡��</li>
					<li>����</li>
					<li>�������</li>
					<li>�κα�ġ</li>
					<li>�밡��</li>
				</ul>
			</li>
		</ul>
	</div>

</body>
</html>