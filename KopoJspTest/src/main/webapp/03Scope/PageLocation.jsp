<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object a2 =  pageContext.getAttribute("pageInt");
	Object b2 = pageContext.getAttribute("pageStr");
	Object c2 = pageContext.getAttribute("pagePerson");
	
%>
<ul>
	<li> Integer Obj = <%=(a2 == null) ? "값 없음" : a2 %></li>
	<li> String Obj = <%=(b2 == null) ? "값 없음" : b2 %></li>
	<li> Person Obj = <%=(c2 == null) ? "값 없음" : ((Person)c2).getName() %></li>
</ul>


</body>
</html>