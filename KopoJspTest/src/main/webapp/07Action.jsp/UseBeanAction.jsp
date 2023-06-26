<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>액션태그 - 자바빈즈</title></head>
<body>
<h2>UseBean 액션태그로 폼값을 한번에 받기</h2>
<jsp:useBean id="person" class="common.Person"/>
<jsp:setProperty property="*" name="person"/>

<ul>
<li><jsp:getProperty property="name" name="person"/></li>
<li><jsp:getProperty property="age" name="person"/></li>
</ul>
</body>
</html>