<%@ page import="membership.*,utils.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title></title></head>
<body>
<%	
	String uid = request.getParameter("user_id");
	String upass = request.getParameter("user_pw");

	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");

	MemberDAO dao = new MemberDAO(driver,url,id,pwd);
	MemberDTO memberDTO = dao.getMemberDTO(uid, upass);	
	
	if(memberDTO.getId()!=null){
		session.setAttribute("UserId",memberDTO.getId());
		session.setAttribute("UserName",memberDTO.getName());
		response.sendRedirect("../08Board/List.jsp");
	} else {
		request.setAttribute("LoginErrMsg","로그인 오류");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
</body>
</html>
