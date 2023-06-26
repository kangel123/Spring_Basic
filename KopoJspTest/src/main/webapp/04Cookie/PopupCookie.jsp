<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chkVal = request.getParameter("inactiveToday");
	if(chkVal != null && chkVal.equals("1")){
	    Cookie cookie = new Cookie("PopupMode", "off");  // 쿠키 생성
	    cookie.setPath(request.getContextPath());  // 경로를 컨텍스트 루트로 설정
	    cookie.setMaxAge(60*60*24);  // 유지 기간을 하루로 설정
	    response.addCookie(cookie);  // 응답 헤더에 쿠키 추가
	}
%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

</body>
</html>