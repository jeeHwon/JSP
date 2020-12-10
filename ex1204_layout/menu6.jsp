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
		//��� �θ޴��� ���� �����
		for(i=0; i<4; i++){
			document.getElementsByClassName("sub")[i].style.display="none"	
		}
		//���õ� �θ޴��� ���̱�
		document.getElementsByClassName("sub")[n].style.display="block"
		
	}
</script>

</head>
<body>
	<div>
		<ul>
			<li class="main" onclick="sub_view(0)">���깰</li>
			<li class="sub">
				<ul>
					<li>�� ��</li>
					<li>������</li>
					<li>�� ��</li>
					<li>������</li>
					<li>�� ��</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(1)">��깰</li>
			<li class="sub">
				<ul>
					<li>��</li>
					<li>����</li>
					<li>����</li>
					<li>ä��</li>
					<li>����</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(2)">�峭��</li>
			<li class="sub">
				<ul>
					<li>�ڵ���</li>
					<li>�κ�Ʈ</li>
					<li>����</li>
					<li>����</li>
					<li>�ǱԾ�</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(3)">���ַ�</li>
			<li class="sub">
				<ul>
					<li>��¡��</li>
					<li>����</li>
					<li>�������</li>
					<li>�κα�ġ</li>
					<li>�밡��</li>
				</ul>
			</li>
			<li class="main" onclick="sub_view(4)">���ַ�</li>
			<li class="sub">
				<ul>
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