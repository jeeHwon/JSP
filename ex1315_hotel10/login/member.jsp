<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<style>
#section{width:1100px; height:500px ;margin:auto; text-align:center;}
#form_box{width:400px; height:300px; margin:auto; margin-top:100px;}
#form_box input{width:300px; height:40px; border:1px solid #5D9CEC; margin-top:20px;}
#form_box input[type=submit]{width:305px; height:40px;color:white; background:#5D9CEC;}
</style>
<script>
	// 과제
	// 아이디 8자 이상 12자 이내
	// 비밀번호 4자 이상 10자이내
	// 비밀번호입력칸 2개의 값이 일치하는지 비교
	// 이름, 아이디, 비밀번호 전화번호는 필히 입력
	var idOk = false
	function check(my){
		if(my.name.value.length == 0){
			alert("이름을 입력하세요")
			return false
		} else if(my.userid.value.length < 8 || my.userid.value.length > 12){
			alert("아이디는 8자 이상 12자 이내로 입력하세요")
			return false
		} else if(my.pwd.value.length < 4 || my.pwd.value.length > 10){
			alert("비밀번호는 4자 이상 10자 이내로 입력하세요")
			return false
		} else if(my.phone.value.length == 0){
			alert("전화번호를 입력하세요")
			return false
		} else {
			if (idOk){
				return true
			} 
			return false
		}
	}
	
	function pwd_check(my){
		if(my.pwd.value != my.pwd1.value){
			document.getElementById("msg").innerHTML="<b>비밀번호가 틀립니다</b>"
			document.getElementById("msg").style.color="red"
		}else{
			document.getElementById("msg").innerHTML="<b>비밀번호가 일치합니다</b>"
			document.getElementById("msg").style.color="green"
		}
	}
	
	var frm = new XMLHttpRequest()
	function id_check(userid){
		frm.open('get', 'id_check.jsp?userid='+userid)
		frm.send()
		frm.onreadystatechange = function(){
			if(frm.readyState==4){
				if(frm.responseText == 0){	// 사용가능 아이디
					document.getElementById("uid").innerHTML="<br><span style='color:blue'> 사용가능 아이디</span>"
					idOk = true
				} else{	// 사용불가 아이디
					document.getElementById("uid").innerHTML="<br><span style='color:red'> 사용불가 아이디</span>"
				}
				
			}
		} 
	}
	
</script>

<div id="section">
<div id="form_box">
	<form method="post" action="member_ok.jsp" onsubmit="return check(this)">
		<div id="name"><input type="text" name="name" placeholder="이름"></div>
		<div id="userid"><input type="text" name="userid" placeholder="아이디" onblur="id_check(this.value)"></div>
			<span id="uid"></span>
		<div id="pwd"><input type="password" name="pwd" placeholder="비밀번호"></div>
		<div id="pwd1"><input type="password" name="pwd1" placeholder="비밀번호확인" onkeyup="pwd_check(this.form)">
			<div id="msg"></div>
		</div>
		<div id="phone"><input type="text" name="phone" placeholder="전화번호"></div>
		<div id="submit"><input type="submit" value="회원가입"></div>
	</form>
</div>
</div>

<%@ include file="../bottom.jsp" %> 

<!-- 
create table hotel_member(
id int auto_increment primary key,
name char(10),
userid char(12),
pwd char(10),
phone char(15),
writeday date,
state int default 0 //정상, 휴면, 탈퇴(0,1,2)
 -->