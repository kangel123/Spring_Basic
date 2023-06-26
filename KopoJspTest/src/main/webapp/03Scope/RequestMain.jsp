<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>

<%
	request.setAttribute("requestStr", "문자열");
	request.setAttribute("requestPerson", new Person("kopo", 20));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String requestStr = request.getAttribute("requestStr").toString();	
	Person requestPerson = (Person) request.getAttribute("requestPerson");	
%>

<h3>저장한 데이터 출력</h3>
<ul>
	<li> String = <%= requestStr%> </li>
	<li> PersonName = <%= requestPerson.getName()%> </li>
	<li> PersonAge = <%= requestPerson.getAge()%> </li>
</ul>

<%
	request.removeAttribute("requestStr");
	request.removeAttribute("requestPerson");		
%>


<h3>삭제 후 데이터 출력</h3>
<ul>
	<li> String = <%=request.getAttribute("requestStr")%> </li>
	<li> Person = <%=request.getAttribute("requestPerson")%> </li>
</ul>

<%
	request.setAttribute("requestStr", "문자열");
	request.setAttribute("requestPerson", new Person("kopo", 20));
	request.getRequestDispatcher("RequestForward.jsp?param1=한글&param2=eng").forward(request, response);
%>

</body>
</html>