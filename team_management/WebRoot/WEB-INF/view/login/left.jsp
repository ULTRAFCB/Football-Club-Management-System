<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background:url('../../images/login_01.jpg');
	background-size: 2000% 100%;
	background-position: bottom;
}
body * {
/* 	opacity:0.5;  */
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}

.STYLE3 {
	font-size: 12px;
	color: #033d61;
}

a {
	text-decoration: none;
}
-->
</style>
<link rel='stylesheet' href='../../plugins/bootstrap/css/bootstrap.min.css'>
<script type="text/javascript"
	src="../../plugins/jquery/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #ffffff;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 3px;
	COLOR: #FFCC00;
	POSITION: relative;
	TOP: 2px
}
a {
color:rgb(24, 115, 170);
}
</style>
<base href="<%=basePath%>">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<ul id="main-nav" class="nav nav-tabs nav-stacked">
				<c:forEach items="${topSet}" var="z">
					<li height="23" background="images/main_47.gif"
						id="imgmenu${z.mid}" class="menu_title"
						onmouseover="this.className='menu_title2';"
						<%-- onclick="showsubmenu(${z.mid})"  --%> onmouseout="this.className='menu_title';"
						style="cursor: hand">
						<a href="#Cimgmenu${z.mid}" class="nav-header collapsed" data-toggle="collapse">
							<i class="glyphicon glyphicon-th-large"></i> ${z.zname} 
							 <span class="pull-right glyphicon glyphicon-chevron-down"></span>
						</a>
						<ul id="Cimgmenu${z.mid}" class="nav nav-list collapse secondmenu"
							style="height: 0px;">
							<c:forEach items="${menuList}" var="c">
								<c:if test="${z.mid==c.pid}">
								<li><a href="${c.url}" target="main"><i class="glyphicon glyphicon-star"></i> ${c.cname} </a></li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
// function showsubmenu(sid)
// {
// whichEl = eval("submenu" + sid);
// imgmenu = eval("imgmenu" + sid);
// if (whichEl.style.display == "none")
// {
// eval("submenu" + sid + ".style.display=\"\";");
// imgmenu.background="images/main_47.gif";
// }
// else
// {
// eval("submenu" + sid + ".style.display=\"none\";");
// imgmenu.background="images/main_48.gif";
// } 
// }

</script>

