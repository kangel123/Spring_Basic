<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/style.css">

<div style="float: right; width: 20%;">
<table>	
		<td align="center">
		<% if(session.getAttribute("UserId")==null){ %>
		<input type="button" class="fourth" value="로그인" onclick="window.location.href = '../06Session/LoginForm.jsp'">
		<% } else { %>
		<input type="button" class="fourth" value="로그아웃" onclick="window.location.href = '../06Session/Logout.jsp'">
		<% } %>
		</td>
	</tr>
</table>
</div>