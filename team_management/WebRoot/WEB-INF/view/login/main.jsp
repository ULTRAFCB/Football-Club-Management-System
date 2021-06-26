<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>足球俱乐部球员信息管理系统</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
	background:url('../../images/login_01.jpg');
	background-size: cover;
}
-->
</style>
<style>
.navPoint {
	COLOR: white;
	CURSOR: hand;
	FONT-FAMILY: Webdings;
	FONT-SIZE: 9pt
}
</style>
<script>
	function switchSysBar() {
		var locate = location.href.replace('common/login/main', '');
		var ssrc = document.all("img1").src.replace(locate, '');
		if (ssrc == "images/main_55.gif") {
			document.all("img1").src = "images/main_55_1.gif";
			document.all("frmTitle").style.display = "none"
		} else {
			document.all("img1").src = "images/main_55.gif";
			document.all("frmTitle").style.display = ""
		}
	}
</script>

	</head>

	<body style="overflow: hidden">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0" style="table-layout: fixed;">
			<tr>
				<td>

					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" style="table-layout: fixed;">
						<tr>
							<td width="210" id=frmTitle noWrap align="center" valign="top">
								<table width="210" height="100%" border="0" cellpadding="0"
									cellspacing="0" style="table-layout: fixed;">
									<tr>
										<td bgcolor="#1873aa" style="width: 6px;">
											&nbsp;
										</td>
										<td width="210">
											<iframe name="menu" height="100%" width="205" src="common/login/left"
												frameborder="0" scrolling="no">
												浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
											</iframe>
										</td>
									</tr>
								</table>
							</td>
							<td width="6" style="width: 6px;" valign="middle"
								bgcolor="1873aa" onclick=switchSysBar()>
								<SPAN class=navPoint id=switchPoint title=关闭/打开左栏><img
										src="images/main_55.gif" name="img1" width=6 height=40 id=img1>
								</SPAN>
							</td>
							<td width="100%" align="center" valign="top">
								<iframe id="main" name="main" height="100%" width="100%" frameborder="0"src="common/login/info">
									</iframe>
							</td>
						</tr>
					</table>

				</td>
				<td width="6" bgcolor="#1873aa" style="width: 6px;">
					&nbsp;
				</td>
			</tr>
		</table>
	</body>
</html>