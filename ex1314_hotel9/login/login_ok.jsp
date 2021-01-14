<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.HotelDAO"%>
<%
	// 사용자가 입력한 userid, pwd를 가져오기
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	//아이디와 비밀번호를 확인하고 세션변수 설정하는 부분 =>  DAO
	HotelDAO hdao = new HotelDAO();
	boolean chk = hdao.isMember(userid, pwd);
	if(chk){
		// 세션변수 생성 => 메인페이지 이동
		session.setAttribute("userid", userid);
		response.sendRedirect("../main/index.jsp");
				
	}else{
		// 로그인 페이지로 다시 이동
		response.sendRedirect("login.jsp?chk=1");
	}
%>