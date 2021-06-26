<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="css/history.css">
<script type="text/javascript" src="plugins/jquery-time/js/jquery.js"></script>
<script type="text/javascript" src="plugins/jquery-time/js/history.js"></script>
<script type="text/javascript" src="plugins/jquery-time/js/jquery.easing.js"></script>
<script type="text/javascript" src="plugins/jquery-time/js/jquery.mousewheel.js"></script>

</head>
<body>
<body>
<div id="arrow"> 
	<ul>
		<li class="arrowup"></li>
		<li class="arrowdown"></li>
	</ul>
</div>
<div id="history">
	<div class="title">
		<h2>网站成长史</h2>
		<div id="circle" onclick="javascript:self.close()">
			<div class="cmsk" ></div>
			<div class="circlecontent">
				<div thisyear="2013" class="timeblock">
					<span class="numf"></span>
					<span class="nums"></span>
					<span class="numt"></span>
					<span class="numfo"></span>
					<div class="clear"></div>
				</div>
				<div class="timeyear">YEAR</div>
			</div>
			<a href="#" class="clock"></a>
		</div>
	</div>
	<div id="content">
		<ul class="list">
			
			
		<c:forEach  items="${summaryList}" var="b" varStatus="status">
			<li>
				<div class="liwrap">
					<div class="lileft">
						<div class="date">
							<span class="year">${b.years}</span>
							<span class="md">${b.days}</span>
						</div>
					</div>
					<div class="point"><b></b></div> 
					<div class="liright">
						<div class="histt"><a href="#">${b.title}</a></div>
						<div class="hisct">${b.content}</div>
					</div>
				</div>
			</li>
		</c:forEach>	

		</ul>

	</div>

</div>




</body>

</html>