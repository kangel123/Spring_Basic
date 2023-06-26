<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person, java.util.*"%>

<html>
<head><title>application 영역</title></head>
<body>
    <h2>application 영역</h2>
<%
    Map<String,Person> map = new HashMap<>();
    map.put("Aclass", new Person("이수일",20));
    map.put("Bclass", new Person("김희애",30));
    
    application.setAttribute("map", map);
%>
    <a href="ApplicationResult.jsp">ApplicationResult.jsp 바로가기</a>
    
    
</body>
</html>