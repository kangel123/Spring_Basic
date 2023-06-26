<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>액션태그 - 자바빈즈</title></head>
<body>
<h2>UseBean 액션태그</h2>
<jsp:useBean id="person" class="common.Person" scope="request"/>
<h3>setProperty 속성 저장</h3>
<jsp:setProperty property="name" name="person" value="임꺽정"/>
<jsp:setProperty property="age" name="person" value="40"/>
<h3>getProperty 값 가져오기</h3>
<ul>
<li><jsp:getProperty property="name" name="person"/></li>
<li><jsp:getProperty property="age" name="person"/></li>
</ul>
</body>
</html>