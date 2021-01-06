<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.dto.BoardDto"%>
<%@ page import="board.dao.BoardDao"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
   	String id = request.getParameter("id");

	BoardDao bdao = new BoardDao();
   	BoardDto chkBdto = bdao.content(id);
   	
   	   	
	if(pwd.equals(chkBdto.getPwd())) {
		BoardDto bdto = new BoardDto();
		bdto.setId(Integer.parseInt(id));
		bdto.setTitle(title);
		bdto.setName(name);
		bdto.setContent(content);
		bdto.setPwd(pwd);
		bdao.update(bdto);
		
		response.sendRedirect("content.jsp?id="+id);
		
	} else{
		response.sendRedirect("content.jsp?id="+id+"&chk=1");
	}

%>