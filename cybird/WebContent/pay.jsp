<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%
	String MGS = "";
	MGS = (String) session.getAttribute("MGS2");
	int intFlag = (Integer) session.getAttribute("FLAG");
	int intTOTAL = (Integer) session.getAttribute("TOTAL");
	int intMany = (Integer) session.getAttribute("MANY");
	if (MGS == null) {
		MGS = " ";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PAY</title>
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

.in {
	font-size: 12pt;
	text-align: center;
	padding: 5px 20px;
}

.next {
	font-size: 12pt;
	text-align: center;
	padding: 5px 20px;
}
.MGS{
	color:red;
}
.text{
	font-size: 150%;
	width: 80px;
	height: 1.5em;
}
.radioArea input[type="radio"] {
  width         : 30pt;
  height        : 30pt;
  vertical-align: top;
  display       : none;
}
.radioArea input[type="radio"] + label {
  padding       : 0 4px;
  font-size     : 20pt;
  font-weight   : bold;
  border        : 2px solid #ffff1a;
  border-radius : 5px;
  background    : #ffffff;
  cursor        : pointer;
  transition    : .2s;
}

.radioArea input[type="radio"]:checked + label {
  background    : #ffff1a;
}
.radioArea input[type="radio"]:not(:checked) + label:hover {
  background    : rgba(255, 255, 26, 0.40);
}
</style>
</head>
<body>
	<h1>
		購入切符 ：
		<%=intMany%>枚
		<%=intTOTAL%>円
	</h1>
	<%
		if (intFlag == 0) {
			int intCash[] = (int[]) session.getAttribute("CASH");
			int intInCash[] = (int[]) session.getAttribute("INCASH");
			int intAns = (Integer) session.getAttribute("ANS");
	%>
	<h1>投入：</h1>
	<form action="./PayServlet" method="post">
	<div class="radioArea" id="makeImg">
		<input type="radio" name="COIN" value=10 checked id="r1"><label for="r1">10円</label>
		<input type="radio" name="COIN" value=50 id="r2"><label for="r2">50円</label>
		<input type="radio" name="COIN" value=100 id="r3"><label for="r3">100円</label>
		<input type="radio" name="COIN" value=500 id="r4"><label for="r4">500円</label>
		 <input type="radio" name="COIN" value=1000 id="r5"><label for="r5">1000円</label>
		<input type="radio" name="COIN" value=5000 id="r6"><label for="r6">5000円</label>
		<input	type="radio" name="COIN" value=10000 id="r7"><label for="r7">10000円</label>
	</div>
		<input type="text" name="SU" class="text">枚
		<input type="hidden" name="check" value="go">
		<input type="submit" name="sb" value="投入" class="in">
		<h2 class="MGS"><%=MGS%></h2>
	</form>

	<h1>
		投入した金額：<%=intAns%>円
	</h1>
	<h2>
		<%
			if (intInCash[0] > 0) {
		%>
		10円<%=intInCash[0]%>枚
		<%
			}
		%>
		<%
			if (intInCash[1] > 0) {
		%>
		50円<%=intInCash[1]%>枚
		<%
			}
		%>
		<%
			if (intInCash[2] > 0) {
		%>
		100円<%=intInCash[2]%>枚
		<%
			}
		%>
		<%
			if (intInCash[3] > 0) {
		%>
		500円<%=intInCash[3]%>枚
		<%
			}
		%>
		<%
			if (intInCash[4] > 0) {
		%>
		1000円<%=intInCash[4]%>枚
		<%
			}
		%>
		<%
			if (intInCash[5] > 0) {
		%>
		5000円<%=intInCash[5]%>枚
		<%
			}
		%>
		<%
			if (intInCash[6] > 0) {
		%>
		10000円<%=intInCash[6]%>枚
		<%
			}
		%>
	</h2>
	<%
		if (intAns >= intTOTAL) {
	%>
	<a href="./CashServlet"><input type="button" value="決済"
		class="next"></a>
	<%
		}
	%>
	<%
		if (intAns < intTOTAL) {
	%>
	<h1 class="MGS"><%=intTOTAL - intAns%>円が足りません
	</h1>
	<%
		}
	%>
	<div class="CASH">
		<h2>手元にある金：</h2>
		10円<%=intCash[0]%>枚<br> 50円<%=intCash[1]%>枚<br> 100円<%=intCash[2]%>枚<br>
		500円<%=intCash[3]%>枚<br> 1000円<%=intCash[4]%>枚<br> 5000円<%=intCash[5]%>枚<br>
		10000円<%=intCash[6]%>枚<br>
	</div>
	<%
		}
	%>
	<%
		if (intFlag == 1) {
	%>
	<form action="./PayServlet" method="post">
		<input type="hidden" name="check" value="go">
		 <input type="submit" name="sb" value="電子マネーで購入します" class="next">
		<%if(!MGS.equals(" ")){
			int intCard = (Integer) session.getAttribute("CARD");
		%>
		<h2 class="MGS"><%=MGS%></h2>
		<h2>残高：<%=intCard %>円</h2>
		<%} %>
	</form>
	<%
		}
	%>
	<form action="./PayServlet" method="post">
		<input type="hidden" name="check" value="cancel"> <input
			type="submit" name="sb" value="キャンセル" class="bottom"
			onClick="window.alert('キャンセルしました。')">
	</form>
</body>
</html>