<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    //쿠키만들기
    document.cookie="name=batman;max-age:60"
    document.cookie="age=42"
    function view(){    //쿠키 보기
        document.getElementById("cook").innerText=document.cookie
    }
    function del(){
        var today = new Date()
        today.setDate(today.getDate()-1)    //today 객체는 오늘에서 어제로 바뀐다
        document.cookie="name=;expires="+today.toGMTString()
    }
</script>
</head>
<body>
    <!-- client_cookie.jsp -->
    <input type="button" onclick="view()" value="쿠키보기">
    <input type="button" onclick="del()" value="쿠키삭제"><p>
    <span id="cook"></span>

</body>
</html>