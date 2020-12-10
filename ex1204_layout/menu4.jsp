<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- ���� ���� �� �θ޴��� �����.���콺 �ָ޴��� ���� ���ΰ� ������ �Ⱥ��̰�. ��ũ��Ʈ�� ���� -->
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
	visibility:hidden;	/*�� �޴��� ���ܶ�*/
}

#first .sub li {
	list-style-type: none;
}
</style>
<script>
	function sub_view(n){	//�� �޴��� ���̰� �ϴ� �޼���
		//���� ������ ��� �θ޴��� class="sub"�� �Ǿ��ִ� => ������ Ŭ������ �迭�� ó��
		//���깰 =>sub[0],��깰 =>sub[1], �峭�� =>sub[2],���ַ� =>sub[3]
		document.getElementsByClassName("sub")[n].style.visibility="visible"
		
	}
	function sub_hide(n){	//�� �޴��� ����� �޼���
		
		document.getElementsByClassName("sub")[n].style.visibility="hidden"
		
	}


</script>

</head>
<body>
	<!-- �޴��� ��� �±׷� ����� ������ �ַ� div, ul -->
	<!-- li �±״� block��=>�� ���� ����, inline=> �ڱ������ ���� -->
	<div id="first">
		<ul id="aa">
			<li onmouseenter="sub_view(0)" onmouseleave="sub_hide(0)">���깰
				<ul class="sub">
					<li>�� ��</li>
					<li>������</li>
					<li>�� ��</li>
					<li>������</li>
					<li>�� ��</li>
				</ul>
			</li>
			<li onmouseenter="sub_view(1)" onmouseleave="sub_hide(1)">��깰
				<ul class="sub">
					<li>��</li>
					<li>����</li>
					<li>����</li>
					<li>ä��</li>
					<li>����</li>
				</ul>
			</li>
			<li onmouseenter="sub_view(2)" onmouseleave="sub_hide(2)">�峭��
				<ul class="sub">
					<li>�ڵ���</li>
					<li>�κ�Ʈ</li>
					<li>����</li>
					<li>����</li>
					<li>�ǱԾ�</li>
				</ul>
			</li>
			<li onmouseenter="sub_view(3)" onmouseleave="sub_hide(3)">���ַ�
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