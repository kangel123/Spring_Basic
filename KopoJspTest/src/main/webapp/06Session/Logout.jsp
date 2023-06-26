<%@ page import="membership.*,utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title></title></head>
<body>
<%	
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");

	// session.invalidate();
	
	response.sendRedirect("LoginForm.jsp");
%>
</body>
</html>
