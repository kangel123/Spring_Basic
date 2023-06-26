<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	long createTime = session.getCreationTime();
	String creationTimStr = dateFormat.format(new Date(createTime));
	
	long lastTime = session.getLastAccessedTime();
	String lastTimStr = dateFormat.format(new Date(lastTime));
	
	session.setMaxInactiveInterval(1800);
%>
<html>
<head><title>session 시간 확인</title></head>
<body>
<h2>설정값 확인</h2>
<ul>
	<li> 세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
	<li> 세션 아이디 : <%= session.getId() %></li>
	<li> 세션 요청 시각 : <%=creationTimStr %></li>
	<li> 세션 마지막 시각 : <%=lastTimStr%></li>
</ul>
</body>
</html>