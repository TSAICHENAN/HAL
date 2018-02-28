<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String MGS = "";
	MGS = (String) session.getAttribute("MGS3");
	int intFlag = (Integer) session.getAttribute("FLAG");
	int intMany = (Integer) session.getAttribute("MANY");
	int intTotal = (Integer) session.getAttribute("TOTAL");

	if (MGS == null) {
		MGS = " ";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cash</title>
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
	line-height: 1.2em; /
	letter-spacing: 2px;
	text-align: left;
	cursor: pointer;
	z-index: 999;
}

.next {
	font-size: 12pt;
	text-align: center;
	padding: 5px 20px;
}
.change{
	color :green;
}
</style>
</head>
<body>
	<h1>
		切符<%=intMany%>枚を購入しました 合計金額：<%=intTotal%>円
	</h1>
	<%
		if (intFlag == 0) {
			int intCash[] = (int[]) session.getAttribute("CASH");
			int intInCash[] = (int[]) session.getAttribute("INCASH");
			int intChangeCion[] = (int[]) session.getAttribute("CHNAGECOIN");
			int intChange = (Integer) session.getAttribute("CHANGE");
			int intAns = (Integer) session.getAttribute("ANS");
	%>

	<h1>
		使った金:<%=intAns%></h1>

	<%
		if (intInCash[6] > 0) {
	%>
	<h2>
		10000円<%=intInCash[6]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intInCash[5] > 0) {
	%>
	<h2>
		5000円<%=intInCash[5]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intInCash[4] > 0) {
	%>
	<h2>
		1000円<%=intInCash[4]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intInCash[3] > 0) {
	%>
	<h2>
		500円<%=intInCash[3]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intInCash[2] > 0) {
	%>
	<h2>
		100円<%=intInCash[2]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intInCash[1] > 0) {
	%>
	<h2>
		50円<%=intInCash[1]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intInCash[0] > 0) {
	%>
	<h2>
		10円<%=intInCash[0]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intChange == 0) {
	%>
	<h1 class="change">
		<%=MGS%>
	</h1>
	<%
		} else {
	%>
	<h1 class="change">
		お釣りは：<%=intChange%>円
	</h1>
	<%
		}
	%>
	<%
		if (intChangeCion[5] > 0) {
	%>
	<h2>
		5000円<%=intChangeCion[5]%>枚
	</h2>
	<%
		}
	%>
	<%
		if (intChangeCion[4] > 0) {
	%>
	<h2>
		1000円<%=intChangeCion[4]%>枚
	</h2>
	<%
		}
	%>

	<%
		if (intChangeCion[3] > 0) {
	%>
	<h2>
		500円<%=intChangeCion[3]%>枚
	</h2>
	<%
		}
	%>

	<%
		if (intChangeCion[2] > 0) {
	%>
	<h2>
		100円<%=intChangeCion[2]%>枚
	</h2>
	<%
		}
	%>

	<%
		if (intChangeCion[1] > 0) {
	%>
	<h2>
		50円<%=intChangeCion[1]%>枚
	</h2>
	<%
		}
	%>

	<%
		if (intChangeCion[0] > 0) {
	%>
	<h2>
		10円<%=intChangeCion[0]%>枚
	</h2>
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
			int intCard = (Integer) session.getAttribute("CARD");
	%>
	<h1 class="change">
		残高:
		<%=intCard%>円
	</h1>
	<%
		}
	%>
	<h1>ご利用いただきありがとうございます</h1>
	<a href="./homepage.jsp"><input type="button" value="完了"
		class="next" class="top"></a>
</body>
</html>