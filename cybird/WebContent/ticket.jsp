<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%
	String MGS = "";
	int intFlag = (Integer) session.getAttribute("FLAG");
	MGS = (String) session.getAttribute("MGS1");
	int intTotal = (Integer) session.getAttribute("TOTAL");
	int intMany = (Integer) session.getAttribute("MANY");
	if (MGS == null) {
		MGS = " ";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TICKET</title>
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
	text-align: left;
	cursor: pointer;
	z-index: 999;
}

.CASHticket {
	display: inline-block;
	border-radius: 31%;
	font-size: 20pt;
	text-align: center;
	cursor: pointer;
	padding: 12px 12px;
	background: #999999;
	color: #ffff1a;
	line-height: 1em;
	opacity: 1;
	transition: .3s;
	box-shadow: 6px 6px 10px #666666;
	margin-bottom: 20px;
}

.CASHticket:hover {
	box-shadow: none;
	opacity: 0.8;
}

.CARDticket {
	display: inline-block;
	border-radius: 31%;
	font-size: 20pt;
	text-align: center;
	cursor: pointer;
	padding: 12px 12px;
	background: #999999;
	color: blue;
	line-height: 1em;
	opacity: 1;
	transition: .3s;
	box-shadow: 6px 6px 10px #666666;
	margin-bottom: 20px;
}

.CARDticket:hover {
	box-shadow: none;
	opacity: 0.8;
}

.bottom {
	display: inline-block;
	border-radius: 20%;
	font-size: 20pt;
	text-align: center;
	cursor: pointer;
	padding: 12px 12px;
	background: #990000;
	color: #ffffff;
	line-height: 1em;
	transition: .3s;
	box-shadow: 6px 6px 10px #666666;
	border: none;
	position: fixed;
	top: 50%;
	right: 45%;
}

.bottom:hover {
	box-shadow: none;
	color: #990000;
	background: #ffffff;
}

.next {
	font-size: 12pt;
	text-align: center;
	padding: 5px 20px;
}
.MGS{
	color:red;
}
.select{
	font-size: 120%;
	width: 100px;
	height: 3em;
}
</style>
</head>
<body>
	<h1>切符の枚数を選択してください</h1>

	<%
		if (intFlag == 0) {
			int intCash[] = (int[]) session.getAttribute("CASH");
	%>
	<form action="./CountServlet" method="post">
		<h2>一枚130円</h2>
		<select name="Count10" class="select">
			<%
				for (int i = 0; i < 10; i++) {
			%>
			<option value=<%=i * 10%>><%=i%></option>
			<%
				}
			%>
		</select> <select name="Count" class="select">
			<%
				for (int i = 0; i < 10; i++) {
			%>
			<option value=<%=i%>><%=i%></option>
			<%
				}
			%>
		</select> <input type="submit" value="確認" name="sb" class="CASHticket"><br>
		<h2 class="MGS"><%=MGS%></h2>
		<div class="CASH">
			<h2>手元にある金：</h2>
			10円<%=intCash[0]%>枚<br> 50円<%=intCash[1]%>枚<br> 100円<%=intCash[2]%>枚<br>
			500円<%=intCash[3]%>枚<br> 1000円<%=intCash[4]%>枚<br> 5000円<%=intCash[5]%>枚<br>
			10000円<%=intCash[6]%>枚<br>
		</div>
	</form>
	<%
		}
	%>
	<%
		if (intFlag == 1) {
	%>
	<h2>一枚124円</h2>
	<form action="./CountServlet" method="post">
		<select name="Count10" class="select">
			<%
				for (int i = 0; i < 10; i++) {
			%>
			<option value=<%=i * 10%>><%=i%></option>
			<%
				}
			%>
		</select> <select name="Count" class="select">
			<%
				for (int i = 0; i < 10; i++) {
			%>
			<option value=<%=i%>><%=i%></option>
			<%
				}
			%>
		</select> <input type="submit" value="確認" name="sb" class="CARDticket"><br>
		<h2 class="MGS"><%=MGS%></h2>

	</form>
	<%
		}
	%>
	<%
		if (intTotal != 0) {
	%>
	<form action="./pay.jsp" method="post">
		<h2><%=intMany%>枚<%=intTotal%>円</h2>

		<input type="submit" value="次へ" name="sb" class="next">
	</form>
	<%
		}
	%>

	<a href="./homepage.jsp"><input type="button" value="キャンセル"
		onClick="window.alert('キャンセルしました。')" class="bottom"></a>
</body>
</html>