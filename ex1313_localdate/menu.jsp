<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var team1 = ['강백호','정대만','채치수','송태섭','서태웅']
	var team2 = ['변덕규','윤대협','허태환','안영수','백정태']
	var team3 = ['김수겸','성현준','장권혁','임택중','오창석']
	var team4 = ['이정환','고민구','신준섭','전호장','홍익현']
	
	function view_member(n){
		var member = document.getElementById("member")
		if(n==0){
			member.options.length = team1.length
			for(i=0; i<team1.length;i++){
				member.options[i].value=i
				member.options[i].text=team1[i]
			}
		}else if(n==1){
			member.options.length = team2.length
			for(i=0; i<team2.length;i++){
				member.options[i].value=i
				member.options[i].text=team2[i]
			}
		}else if(n==2){
			member.options.length = team3.length
			for(i=0; i<team3.length;i++){
				member.options[i].value=i
				member.options[i].text=team3[i]
			}
		} else{
			member.options.length = team4.length
			for(i=0; i<team4.length;i++){
				member.options[i].value=i
				member.options[i].text=team4[i]
			}
		}
	}
</script>
</head>
<body onload="view_member(0)">
<select id="sel" onchange="view_member(this.value)">
	<option value="0">북산</option>
	<option value="1">능남</option>
	<option value="2">상양</option>
	<option value="3">해남</option>
</select>
<select id="member">
</select>
</body>
</html>