<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>Session login</title></head>
<body>
<jsp:include page="../Common/Link.jsp"></jsp:include>

<h2>로그인 페이지</h2>
<span style="color : red; font-size:1.2em;">
<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
</span>
<% if(session.getAttribute("UserId")== null){ %>
<script>
function validatFrom(form){
	if(!form.user_id.value){
		alert("아이디를 입력하세요");
		return fals;
	}
	if(form.user_pw.value==""){
		alert("패스워드를 입력하세요");
		return fals;
	}
}
</script>
<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validatFrom(this);">
	아이디 : <input type="text" name="user_id"/><br>
	패스워드 : <input type="password" name="user_pw"/>
	<input type="submit" value="로그인"/>
</form>
<% } else{ %>
<%=session.getAttribute("UserName") %> 회원님 로그인하셨습니다.

<% } %>
</body>

</html>