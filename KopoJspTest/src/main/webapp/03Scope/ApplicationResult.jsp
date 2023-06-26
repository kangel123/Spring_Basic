<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person, java.util.*"%>
    
<html>
<head><title>session 영역</title></head>
<body>
    <h2>페이지 이동 후 session 영역 읽기</h2>
    <%
    Map<String,Person> map = (Map<String,Person>)application.getAttribute("map");
    
    for(String key:map.keySet()){
    	Person person = (Person) map.get(key); 
    	out.print(key+":"+person.getName()+"("+person.getAge()+")<br/>");
    }
    %>
    
</body>
</html>
