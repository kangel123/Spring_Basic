<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>

<%
	pageContext.setAttribute("pageInt", 10);
	pageContext.setAttribute("pageStr", "페이지저장");
	pageContext.setAttribute("pagePerson", new Person("kopo", 50));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int a =  (Integer) (pageContext.getAttribute("pageInt"));
	String b = pageContext.getAttribute("pageStr").toString();
	Person c = (Person) (pageContext.getAttribute("pagePerson"));	
%>
<ul>
	<li> Integer Obj = <%=a %></li>
	<li> String Obj = <%=b %></li>
	<li> Person Obj = <%=c.getName() %>, <%=c.getAge() %></li>
</ul>

</body>
</html>