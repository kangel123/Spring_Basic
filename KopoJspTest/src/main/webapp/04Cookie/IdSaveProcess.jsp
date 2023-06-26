<%@ page import="utils.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title>쿠키로 아이디 저장하기</title></head>
<body>
<% 
	String save_check=request.getParameter("save_check");
	String user_id=request.getParameter("user_id");
	String user_pw=request.getParameter("user_pw");
	if ("kopo".equals(user_id) && "1234".equals(user_pw)) {
	    if(save_check!=null && save_check.equals("Y")) {
	    	CookieManager.makeCookie(response, "loginId", user_id, 60*60*24);
	    } else {
			CookieManager.deleteCookie(response, "loginId");
	    }
	    JSFunction.alertLocation("로그인 성공", "IdSaveMain.jsp", out);
	}
	else {
		JSFunction.alertBack("로그인 실패", out);
	}
%>    
</body>
</html>