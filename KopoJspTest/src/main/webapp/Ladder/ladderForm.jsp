<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ladder.*,java.util.*" %>
<%@ page import="utils.*"%>
<!DOCTYPE html>
<html>
<head>
<%
	List<String> student = new ArrayList<>();
		
    request.setCharacterEncoding("UTF-8");  
    int row=8;
    int col=16;
    try{
		row = Integer.parseInt(request.getParameter("row"));
		col = Integer.parseInt(request.getParameter("col"));
    } catch(Exception e){
		JSFunction.alertBack("높이와 인원 입력이 잘못되었습니다", out);	    	
    }
	if(2>row || 2>col){
		row=2;
		col=2;				
	} else if(row>30 || col>30) {
		row=15;
		col=30;		
	}
	session.setAttribute("ladderClass", new Ladder(row,col));
%>
<style>
    	.main {
    		text-align:center;    		
            width: 100%;
            height: 100%;
        }
        
        .ladder{        	
            margin-left: 0;
        }
        
        .ladder-vertical-line {
            width: 5px;
            height: calc(400px/ <%=row%>);
            background-color: black;
            margin:0;
            padding: 0;
        }
        .ladder-column {
        	width:calc(100% / <%= col %>);
            float: left;
            position: relative;
        }
        .ladder-horizontal-noline {
            width: 5px;
            height: 5px;
            background-color: black;
        }
        
        .ladder-horizontal-line {
            width: 0;
            height: 5px;
            background-color: black;
        }    
        .input-text{
        	text-align: center;
        	width:0;
        }
        
        .fourth {
			background: gold;
			border-color: white;
			color: black;
			background-image: linear-gradient(45deg, yellow 50%, transparent 50%);
			background-position: 100%;
			background-size: 400%;
			transition: background 300ms ease-in-out;
			border-radius: 5px;
			font-size: 20px;
		}
		
		.fourth:hover {
			background-position: 0;
		}
    </style>
</head>

<body>
<div class='main'>
<h1>사다리타기</h1>
<hr>
    <form method="post" action="gameStart.jsp">
    <input type="hidden" name="row" value="<%=row%>">
    <input type="hidden" name="col" value="<%=col%>">
	<%
        for (int j = 0; j < col; j++) {
			String top = request.getParameter("top" + j);
			String bottom = request.getParameter("bottom" + j);
			if(top!=null && bottom!=null){
				top = request.getParameter("top" + j).replace("&", "&amp;").replace("<","&lt;").replace(">","&gt;");
				bottom = request.getParameter("bottom" + j).replace("&", "&amp;").replace("<","&lt;").replace(">","&gt;");
			}
            out.print("<div class='ladder-column'>");
            if(top!=null)
	            out.print("<input type='text' class='input-text' name='top"+j+"' value='"+top+"'>");
            else
	            out.print("<input type='text' class='input-text' name='top"+j+"'>");   
            out.print("<div class='ladder'>");
            
            for (int i = 0; i < row; i++) {
                out.print("<div class='ladder-vertical-line'></div>");
                out.print("<div class='ladder-horizontal-noline'></div>");                       
            }

            
            out.print("<div class='ladder-vertical-line'></div>");
            out.print("</div>");
            if(bottom!=null)
	            out.print("<input type='text' class='input-text' name='bottom"+j+"' value='"+bottom+"'>");
            else
	            out.print("<input type='text' class='input-text' name='bottom"+j+"'>");  

            out.print("</div>");
        }
    %>
    <p>
	    <input type="submit" class='fourth' value="시작">    
	    <input type="button" class='fourth' value="취소" onclick="window.location.href='index.html'">
	</p>
    </form>        
</div>
</body>

<script>

    function setLadderMargin() {
        var col = <%= col %>; // JSP 변수 col의 값을 가져옴
        var ladderElements = document.querySelectorAll('.ladder');
        var ladderHorizontalElements = document.querySelectorAll('.ladder-horizontal-line');
        var inputElements = document.querySelectorAll('.input-text');
        
        var screenWidth = window.innerWidth || document.documentElement.clientWidth; // 화면의 너비 가져오기

        var marginValue = screenWidth / col / 2; // margin-left 값 계산
        
        ladderElements.forEach(function(element) {
            element.style.marginLeft = marginValue + 'px'; // 계산된 값으로 margin-left 설정
        });

        ladderHorizontalElements.forEach(function(element) {
			var ladderColumnElement = document.querySelector('.ladder-column');
			var columnWidth = getComputedStyle(ladderColumnElement).width;
			
            element.style.width = columnWidth; 
        });
        
        inputElements.forEach(function(element) {
			var ladderColumnElement = document.querySelector('.ladder-column');
			var columnWidth = getComputedStyle(ladderColumnElement).width;
			element.style.width = (parseInt(columnWidth)/2) + 'px';

        });
    }
    
    window.addEventListener('DOMContentLoaded', setLadderMargin);
    window.addEventListener('resize', setLadderMargin); // 화면 크기 변경 시에도 재계산
</script>
</html>


