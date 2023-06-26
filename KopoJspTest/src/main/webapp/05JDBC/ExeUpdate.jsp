<%@ page import="common.JDBConnect"%>
<%@ page import="common.DBConnPool"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title></title></head>
<body>
<h2>JDBC TEST1</h2>

<%--
	JDBConnect jdbc = new JDBConnect();
	String id = "test1";
	String pass = "1111";
	String name = "테스트1";
	
	String sql="insert into member values (?,?,?,sysdate)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1,id);
	psmt.setString(2,pass);
	psmt.setString(3, name);
	
	int inReslut = psmt.executeUpdate();
	out.println(inReslut+"row 행 입력 완료");
		
	jdbc.close();
--%>

<%
	JDBConnect jdbc = new JDBConnect();

	String sql="select * from member";
	Statement smt = jdbc.con.createStatement();
	ResultSet rset = smt.executeQuery(sql);
	while(rset.next()){
		String id = rset.getString(1);
		String pass = rset.getString(2);
		String name = rset.getString(3);
		String date = rset.getString(4);
		out.println("id:"+id+" pass:"+pass+" name:"+name+" date:"+date+"<br>");
	}
	jdbc.close();
%>

</body>
</html>
