<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	//setTimeout, setInterval => Ư���ð��Ŀ� ���(�Լ�)�� ȣ���ϴ� �޼ҵ�
	function show(){
		alert("�ȳ��ϼ���")
	}
	function win_open(){
		window.open("","","width=100, height=100")
	}
	//setTimeout(show, 3000)	//setTimeout(�Լ�, �ð�) => �ð��Ŀ� �Լ��� 1�� �����϶�
	//setInterval(show, 3000)	//setInterval(�Լ�, �ð�)=> �ð��Ŀ� �Լ��� �����϶�(���ѹݺ�)
	setIn/terval(win_open, 3000)
</script>
</head>
<body>


</body>
</html>