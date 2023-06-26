<%@ page import="utils.JSFunction" %>
<%@ page import="model1.BoardDAO" %>
<%@ page import="model1.BoardDTO" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
	String postdate = dateFormat.format(new Date()); 
	
%>   
<html>
<head></head>
<body>

	<% 	if(session.getAttribute("UserId")== null){
			JSFunction.alertBack("로그인 후에 사용가능합니다.", out);
		} else{ 
	%>
		
	<jsp:useBean id="board" class="model1.BoardDTO"/>
	<jsp:setProperty property="*" name="board"/>
	
	<%
			board.setId(session.getAttribute("UserId").toString());
			BoardDTO boardDTO = new BoardDTO();			
			BoardDAO boardDAO = new BoardDAO(application);
			boolean success = boardDAO.Write(boardDTO);
		} 
	%>
</body>
</html>