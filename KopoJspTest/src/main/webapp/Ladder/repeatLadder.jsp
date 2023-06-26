<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<%@ page import="ladder.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int row = Integer.parseInt(request.getParameter("row"));
	int col = Integer.parseInt(request.getParameter("col"));

	session.setAttribute("ladderClass", new Ladder(row,col));
%>

<form id="redirectForm" method="post" action="gameStart.jsp">
	<%	
    	for (int j = 0; j < col; j++) {
    		String top = request.getParameter("top"+j);
    		String bottom = request.getParameter("bottom"+j);
    		if(top!=null)
	            out.print("<input type='hidden' class='input-text' name='top"+j+"' value='"+top+"'>");
            else
	            out.print("<input type='hidden' class='input-text' name='top"+j+"'>");   
            if(bottom!=null)
	            out.print("<input type='hidden' class='input-text' name='bottom"+j+"' value='"+bottom+"'>");
            else
	            out.print("<input type='hidden' class='input-text' name='bottom"+j+"'>");  
		}
	%>	
    
</form>

</body>
<script>
    document.getElementById("redirectForm").submit();
</script>
</html>