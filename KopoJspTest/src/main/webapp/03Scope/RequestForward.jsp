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
	request.setCharacterEncoding("UTF-8");
	Object requestStr = request.getAttribute("requestStr");
	Object requestPerson = request.getAttribute("requestPerson");	
	Object param1 = request.getParameter("param1");	
	Object param2 = request.getParameter("param2");	
%>

<ul>
	<li> String Obj = <%=(requestStr == null) ? "값 없음" : requestStr %></li>
	<li> Person Obj = <%=(requestPerson == null) ? "값 없음" : ((Person)requestPerson).getName() %></li>
	<li> String param1 = <%=(param1 == null) ? "값 없음" : param1 %></li>
	<li> String param2 = <%=(param2 == null) ? "값 없음" : param2 %></li>
</ul>
</body>
</html>