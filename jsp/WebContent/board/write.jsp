<%@page import="com.web.board.dao.BoardDAO"%>
<%@page import="com.web.board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.println("/borad/write.jsp"); %>
<% 
//한글처리
request.setCharacterEncoding("utf-8");
// 이곳이 자바 부분
BoardDTO dto = new BoardDTO();
//request 에서 데이터를 꺼내서 dto에 담는다
dto.setTitle(request.getParameter("title"));
dto.setContent(request.getParameter("content"));
dto.setWriter(request.getParameter("writer"));
System.out.println(dto);
// BoardDAO에 write(dto) 메서드를 이용해서 DB에 저장하는 처리
BoardDAO dao = new BoardDAO();
dao.write(dto);
%>


<% response.sendRedirect("list.jsp"); %>

