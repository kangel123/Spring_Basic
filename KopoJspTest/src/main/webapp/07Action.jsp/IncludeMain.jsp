<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String outPath1 = "./inc/OuterPage1.jsp";
String outPath2 = "./inc/OuterPage2.jsp";

pageContext.setAttribute("pAttr","동명왕");
request.setAttribute("rAttr","온조왕");
%>
<html>
<head><title>외부 파일 읽기</title></head>
<body>
<h2> 지시어 VS 액션태그 방식 비교</h2>
<%@ include file="./inc/OuterPage1.jsp"%>
<%= newVar1%>
<%-- <%@ include file=outPath1%> --%>

<jsp:include page="./inc/OuterPage2.jsp"/>
<%-- <%= newVar2 %> --%>
<jsp:include page="<%=outPath2%>" />


</body>

</html>