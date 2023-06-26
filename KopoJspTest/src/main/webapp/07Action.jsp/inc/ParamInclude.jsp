<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title>인클루드 된 페이지에서 변수 확인</title></head>
<body>
<jsp:useBean id="person" class="common.Person" scope="request"/>

<h2>매개변수 확인</h2>
<%=request.getParameter("loc1") %>
<%=request.getParameter("loc2") %>
</body>
</html>