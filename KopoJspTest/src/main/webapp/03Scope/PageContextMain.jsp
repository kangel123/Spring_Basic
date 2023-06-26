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
	int pPageInt =  (Integer) (pageContext.getAttribute("pageInt"));
//	String pPageStrt = pageContext.getAttribute("pageStr").toString();
	Person pPagePerson = (Person) (pageContext.getAttribute("pagePerson"));
	
%>
<ul>
	<li> Integer Obj = <%=pPageInt%></li>
	<li> String Obj = <%=pageContext.getAttribute("pageStr") %></li>
	<li> Person Obj = <%=pPagePerson.getName() %>, <%=pPagePerson.getAge() %></li>
</ul>

<%@ include file="PageInclude.jsp" %>

<a href="PageLocation.jsp">Location</a>
</body>
</html>