<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ladder.*,java.util.*"%>
<%@ page import="utils.*"%>
<!DOCTYPE html>
<html>
<head>
<%
request.setCharacterEncoding("UTF-8");
Ladder ladderClass = (Ladder) session.getAttribute("ladderClass");
int row;
int col;
int[][] ladder;

if (ladderClass != null) {
	row = ladderClass.getRow();
	col = ladderClass.getCol();
	ladder = ladderClass.getLadderLine();
} else {
	JSFunction.alertLocation("세션이 만료되었습니다", "index.html", out);
	return;
}
%>
<title>사다리타기 시작</title>

</head>

<style>
.main {
	text-align: center;
	width: 100%;
	height: 100%;
}

.title {
	width: 100%;
	height: 10%;
}

.ladder {
	margin-left: 0;
}

.ladder-vertical-line {
	width: 5px;
	height: calc(400px/ <%=row%>);
	background-color: black;
}

.ladder-column {
	width: calc(100%/ <%=col%>);
	height: 90%;
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

.invisible-input {
	border: none;
	pointer-events: none;
	text-align: center;
}

div#hidden {
	position: absolute;
	top: 20%;
	left: 10%;
	color: black;
	width: 80%;
	height: calc(65px * <%=row%>);
	background: gold;
}
div#hidden>div{
        position: relative; background-color:#4A655A; top:0px;
        border:1px solid gray; margin:20px; color:white; height:80%;
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

<body>

	<%
	Service service = new Service();
	HashMap<Integer, Integer> result = new HashMap<>();
	result = service.getResult(ladder);
	%>

	<div class='main'>
		<div class='title'>
			<h1>사다리타기</h1>
		</div>
		<hr>
		<form method="post">
			<input type="hidden" name="row" value="<%=row%>"> <input
				type="hidden" name="col" value="<%=col%>">
			<%
			for (int j = 0; j < col; j++) {
				String top = request.getParameter("top" + j).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
				String bottom = request.getParameter("bottom" + j).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
				request.setAttribute("top" + j, top);
				request.setAttribute("bottom" + j, bottom);

				out.print("<div class='ladder-column'>");
				out.print("<input class='invisible-input' type='text' name='top" + j + "' value='" + top + "' size='5'>");
				out.print("<div class='ladder'>");

				for (int i = 0; i < row; i++) {
					out.print("<div class='ladder-vertical-line'></div>");
					if (j < col - 1 && ladder[i][j] == 1) {
				out.print("<div class='ladder-horizontal-line' id='" + i + "line" + j + "'></div>");
					} else {
				out.print("<div class='ladder-horizontal-noline'></div>");
					}
				}
				out.print("<div class='ladder-vertical-line'></div>");
				out.print("</div>");

				out.print("<input class='invisible-input' type='text' name='bottom" + j + "' value='" + bottom + "' size='5'>");
				out.print("</div>");
			}
			%>
			<div>
				<input type="submit" class="fourth" value="재입력" formaction="ladderForm.jsp">
				<input type="submit" class="fourth" value="다시하기" formaction="repeatLadder.jsp">
				<input type="button" class="fourth" value="전체 결과" id="openBtn" />
			</div>
		</form>

		<div id="hidden">
			<h2>최종 결과</h2>
			<div>
					<%
					for (Map.Entry<Integer, Integer> entry : result.entrySet()) {
						String key = (String) request.getAttribute("top" + entry.getKey());
						String value = (String) request.getAttribute("bottom" + entry.getValue());
						out.println("<p style='margin:0;'>" + key + "->" + value + "</p>");
					}
					%>
			<p><input type="button" class="fourth" value="닫기" id="closeBtn" /></p>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
	$('#hidden').hide();
		$('#openBtn').click(function() {
		    $('#hidden').show();	   
		});
	    $('#closeBtn').click(function() {
	        $('#hidden').hide();
	    });
	});
	
	function goBack() {
		var row = <%=row%>;
		var col = <%=col%>;
		location.href = "./ladderForm.jsp?row=<%=row%>&col=<%=col%>";
	}


    function setLadderMargin() {
        var col = <%=col%>; // JSP 변수 col의 값을 가져옴
        var ladderElements = document.querySelectorAll('.ladder');
        var ladderHorizontalElements = document.querySelectorAll('.ladder-horizontal-line');
        
        var screenWidth = window.innerWidth || document.documentElement.clientWidth; // 화면의 너비 가져오기

        var marginValue = screenWidth / col / 2; // margin-left 값 계산
        
        ladderElements.forEach(function(element) {
            element.style.marginLeft = marginValue + 'px'; // 계산된 값으로 margin-left 설정
        });

        ladderHorizontalElements.forEach(function(element) {
			var ladderColumnElement = document.querySelector('.ladder-column');
			var columnWidth = getComputedStyle(ladderColumnElement).width;
			
            element.style.width = columnWidth; // 계산된 값으로 margin-left 설정
        });
    }
    
    window.addEventListener('DOMContentLoaded', setLadderMargin);
    window.addEventListener('resize', setLadderMargin); // 화면 크기 변경 시에도 재계산
</script>

</html>


