<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head></head>
<body>

	<% 	if(session.getAttribute("UserId")== null){
			JSFunction.alertBack("로그인 후에 사용가능합니다.", out);
		} else{ 
	%>
	<jsp:include page="../Common/Link.jsp" />  <!-- 공통 링크 -->

    <h2>게시물 쓰기(List)</h2>
    <form method="post" action="WriteProcess.jsp">  
    	<div style="width:90%;">
		    <table style="width:100%; text-align:center" border="1">
			    <tr>
			        <td>제목</td>
			        <td><input style="width:100%;" type="text" name="title"></td>        
			    </tr>   		    
			    <tr>
			        <td>내용</td>
			        <td><textarea style="width:100%; resize: none;" name="content" id="content" cols="100" rows="20" readonly></textarea></td>        
			    </tr>   		    		  	
		    </table>
	    </div>
		<div style="float: right; width: 20%;">
			<br>
		    <input type="submit" value="쓰기">
		    <input type="reset" value="취소" onclick="window.location.href = './List.jsp'">
	    </div>
    </form>
	<%} %>
</body>
</html>