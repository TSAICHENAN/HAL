<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.removeAttribute("MGS1");
	session.removeAttribute("MGS2");
	session.removeAttribute("MGS3");
	session.removeAttribute("ANS");
	int intCash[] = (int[]) session.getAttribute("CASH");
	int intCard = (Integer) session.getAttribute("CARD");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HOME</title>
<style type="text/css">
* {
	margin: 0;
	text-align: center;
	margin-bottom: 20px;
}
.CASH {
	display: inline-block;
	position: fixed;
	top: 100px;
	right: 30px;
	padding: 10px 10px;
	background: #000066;
	color: #ffffff;
	opacity: 0.5;
	border-radius: 5%;
	font-size: 15pt;
	font-weight: bold;
	line-height: 1.2em;
	letter-spacing: 2px;
	text-align:left;
	cursor: pointer;
	z-index: 999;
}

.submit1 {
	display: inline-block;
	font-size: 50pt;
	text-align: center;
	cursor: pointer;
	padding: 70px 40px;
	background: #999999;
	color: #ffff1a;
	line-height: 1em;
	transition: .3s;
	box-shadow: 6px 6px 3px #666666;
	border: 2px solid #999999;
	float: left;
	margin-left: 20%;
	margin-top: 15%;
	width:500px;
}

.submit1:hover {
	box-shadow: none;
	color: #999999;
	background: #ffff1a;
}
.submit2 {
	display: inline-block;
	font-size: 50pt;
	text-align: center;
	cursor: pointer;
	padding: 70px 50px;
	background: #999999;
	color: #1a1aff;
	line-height: 1em;
	transition: .3s;
	box-shadow: 6px 6px 3px #666666;
	border: 2px solid #999999;
	float: right;
	 margin-right: 20%;
	margin-top: 15%;
	width:500px;
}

.submit2:hover {
	box-shadow: none;
	color: #999999;
	background: #1a1aff;
}
.Re {
	position: fixed;
	bottom: 100px;
	right: 45%;
	display: inline-block;
	border-radius: 50%;
	font-size: 17pt;
	text-align: center;
	cursor: pointer;
	padding: 36px 36px;
	background: #000000;
	color: #ffffff;
	line-height: 1em;
	transition: .3s;
	box-shadow: 6px 6px 3px #666666;
	border: 2px solid #000000;
}

.Re:hover {
	box-shadow: none;
	color: #000000;
	background: #ffffff;
}
</style>
</head>
<body>
	<form action="./TicketServlet" method="post">
		<input type="submit" name="sb" value="現金" class="submit1"> <input
			type="hidden" name="check" value="0">
	</form>
	<form action="./TicketServlet" method="post">
		<input type="submit" name="sb" value="電子マネー" class="submit2"> <input
			type="hidden" name="check" value="1">
	</form>

	<div class="CASH">
		<h2>手元にある金:</h2>
		10円<%=intCash[0]%>枚<br>
		50円<%=intCash[1]%>枚<br>
		100円<%=intCash[2]%>枚<br>
		500円<%=intCash[3]%>枚<br>
		1000円<%=intCash[4]%>枚<br>
		 5000円<%=intCash[5]%>枚<br>
		10000円<%=intCash[6]%>枚<br>
		<br>
		<h2>電子マネー残高:</h2>
		<%=intCard %>円
	</div>

	<a href="./IndexServlet"><input type="button" value="初期化" class="Re" onClick="window.alert('初期化されました。')"></a>
</body>
</html>