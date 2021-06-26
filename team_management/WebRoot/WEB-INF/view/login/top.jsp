<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}

.STYLE2 {
	font-size: 9px
}

.STYLE3 {
	color: #033d61;
	font-size: 12px;
}
-->
</style>
<link rel='stylesheet' href='plugins/bootstrap/css/bootstrap.min.css'>
<script type="text/javascript"
	src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function clickBtn(url) {
		window.top.location.href = url;
		//parent.document.getElementById("mainFrame").src = url;
		//location.href = url;
	}
</script>
</head>

<body style="background: url('images/login_01.jpg');background-size: cover;">
	<div  class="container" style="width: 60px; height: 50px; background:url('images/logo162.png');background-size: 100% 100%; margin: 20px 50px 0px 50px;"></div>
	<div class="container">
		<div  class="row">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: -30px;">
				<tr>
					<td height="38"><table width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td><table width="100%" border="0" cellspacing="0"
										cellpadding="0">
										<tr>
											<td width="77%" height="25" valign="bottom"><table
													width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="50" height="19" style=" cursor: pointer; background-color: rgb(24, 115, 170);  color: #FFFFFF; "><div align="center" onclick="clickBtn('common/login/index')">
<!-- 																<img src="images/main_12.gif" width="49" height="19" -->
<!-- 																	 onclick="clickBtn('common/login/index')" > -->
																首页
															</div></td>
														<td width="50" style=" cursor: pointer; background-color: rgb(24, 115, 170);  color: #FFFFFF; "><div align="center" onclick="javascript:history.go(-1)">
<!-- 																<img src="images/main_14.gif" width="48" height="19" -->
<!-- 																	onclick="javascript:history.go(-1)"> -->
																上一页
															</div></td>
														<td width="50" style=" cursor: pointer; background-color: rgb(24, 115, 170);  color: #FFFFFF; "><div align="center" onclick="javascript:history.go(1)">
<!-- 																<img src="images/main_16.gif" width="48" height="19" -->
<!-- 																	onclick="javascript:history.go(1)"> -->
																下一页
															</div></td>
														<td width="50" style=" cursor: pointer; background-color: rgb(24, 115, 170);  color: #FFFFFF; "><div align="center" onclick="clickBtn('common/login/index')">
<!-- 																<img src="images/main_18.gif" width="48" height="19" -->
<!-- 																	onclick="clickBtn('common/login/index')"> -->
																刷新
															</div></td>
														<td width="50" style=" cursor: pointer; background-color: rgb(24, 115, 170);"><div align="center">
																<a href="<%=path%>/loginCtrl/exit" target="_top" style=" color: #FFFFFF; "><!-- <img
																	src="images/main_20.gif" width="48" height="19"> -->
																	退出	
																</a>
															</div></td>
														<td>&nbsp;</td>
													</tr>
												</table></td>
											<td width="220" valign="bottom" nowrap="nowrap"><div
													align="right">
													<span class="STYLE1">
														时间： <SCRIPT language=JavaScript type=text/javascript>
														<!--
															var enabled = 0;
															today = new Date();
															var day;
															var date;
															if (today.getDay() == 0)
																day = " 星期日"
															if (today.getDay() == 1)
																day = " 星期一"
															if (today.getDay() == 2)
																day = " 星期二"
															if (today.getDay() == 3)
																day = " 星期三"
															if (today.getDay() == 4)
																day = " 星期四"
															if (today.getDay() == 5)
																day = " 星期五"
															if (today.getDay() == 6)
																day = " 星期六"
															date = (today
																	.getFullYear())
																	+ "年"
																	+ (today
																			.getMonth() + 1)
																	+ "月"
																	+ today
																			.getDate()
																	+ "日"
																	+ day
																	+ "";
															document
																	.write(date);
														// -->
														</SCRIPT></span>
												</div></td>
										</tr>
									</table></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</div>
	</div>
	<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
		<tr>
			<td height="70" ><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="24"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" height="24" background="images/main_03.gif">&nbsp;</td>
									<td width="505" background="images/main_04.gif">&nbsp;</td>
									<td>&nbsp;</td>
									<td width="21"><img src="images/main_07.gif" width="21"
										height="24"></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="38"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" height="38" background="images/main_09.png">&nbsp;</td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="77%" height="25" valign="bottom"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="50" height="19"><div align="center">
																	<img src="images/main_12.gif" width="49" height="19"
																		onclick="clickBtn('common/login/index')">
																</div></td>
															<td width="50"><div align="center">
																	<img src="images/main_14.gif" width="48" height="19"
																		onclick="javascript:history.go(-1)">
																</div></td>
															<td width="50"><div align="center">
																	<img src="images/main_16.gif" width="48" height="19"
																		onclick="javascript:history.go(1)">
																</div></td>
															<td width="50"><div align="center">
																	<img src="images/main_18.gif" width="48" height="19"
																		onclick="clickBtn('common/login/index')">
																</div></td>
															<td width="50"><div align="center">
																	<a href="<%=path%>/loginCtrl/exit" target="_top"><img
																		src="images/main_20.gif" width="48" height="19"></a>
																</div></td>
															<td width="26"><div align="center">
																	<img src="images/main_21.gif" width="26" height="19">
																</div></td>
															<td>&nbsp;</td>
														</tr>
													</table></td>
												<td width="220" valign="bottom" nowrap="nowrap"><div
														align="right">
														<span class="STYLE1"><span class="STYLE2">■</span>
															今天是： <SCRIPT language=JavaScript type=text/javascript>
															<!--
																var enabled = 0;
																today = new Date();
																var day;
																var date;
																if (today
																		.getDay() == 0)
																	day = " 星期日"
																if (today
																		.getDay() == 1)
																	day = " 星期一"
																if (today
																		.getDay() == 2)
																	day = " 星期二"
																if (today
																		.getDay() == 3)
																	day = " 星期三"
																if (today
																		.getDay() == 4)
																	day = " 星期四"
																if (today
																		.getDay() == 5)
																	day = " 星期五"
																if (today
																		.getDay() == 6)
																	day = " 星期六"
																date = (today
																		.getFullYear())
																		+ "年"
																		+ (today
																				.getMonth() + 1)
																		+ "月"
																		+ today
																				.getDate()
																		+ "日"
																		+ day
																		+ "";
																document
																		.write(date);
															// -->
															</SCRIPT></span>
													</div></td>
											</tr>
										</table></td>
									<td width="21"><img src="images/main_11.gif" width="21"
										height="38"></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="8" style="line-height: 8px;"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" background="images/main_29.gif"
										style="line-height: 8px;">&nbsp;</td>
									<td width="505" background="images/main_30.gif"
										style="line-height: 8px;">&nbsp;</td>
									<td style="line-height: 8px;">&nbsp;</td>
									<td width="21" style="line-height: 8px;"><img
										src="images/main_31.gif" width="21" height="8"></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="28" background="images/main_36.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="177" height="28" background="images/main_32.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="20%" height="22">&nbsp;</td>
									<td width="59%" valign="bottom"><div align="center"
											class="STYLE1">当前用户：${realname }</div></td>
									<td width="21%">&nbsp;</td>
								</tr>
							</table></td>

						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="60%"><marquee behavior="scroll"
											scrolldelay="20" direction="left">
											<c:forEach items="${noticeList}" var="a">
      	 ${a.content}
       </c:forEach>
										</marquee></td>
								</tr>
								<c:if test="${ trightname=='bo1ss'}">
									<tr>
										<td width="65" height="28"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td height="23" valign="bottom"><table width="58"
															border="0" align="center" cellpadding="0" cellspacing="0">
															<tr>
																<td height="20" style="cursor: hand"
																	onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<div align="center" class="STYLE3">
																		<a href="QueryCommentsServlet?action=coach&currpage=1"
																			target="main">评价信息</a>
																	</div>
																</td>
															</tr>
														</table></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryDataServlet?action=player&currpage=1"
																target="main">数据统计</a>
														</div></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryTeamServlet?action=player&currpage=1"
																target="main">球队阵容</a>
														</div></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryTrainServlet?action=player&currpage=1"
																target="main">训练计划</a>
														</div></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryMemoServlet?currpage=1" target="main">备忘录</a>
														</div></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryScheduleServlet?action=staff&currpage=1"
																target="main">员工日程</a>
														</div></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryScheduleServlet?action=coach&currpage=1"
																target="main">教练日程</a>
														</div></td>
												</tr>
											</table></td>
										<td width="3"><img src="images/main_34.gif" width="3"
											height="28"></td>
										<td width="63"><table width="58" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td height="20" style="cursor: hand"
														onMouseOver="this.style.backgroundImage='url(images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "
														onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div
															align="center" class="STYLE3">
															<a href="QueryScheduleServlet?action=player&currpage=1"
																target="main">球员日程</a>
														</div></td>
												</tr>
											</table></td>
										<td>&nbsp;</td>
									</tr>
								</c:if>
							</table></td>

						<td width="21"><img src="images/main_37.gif" width="21"
							height="28"></td>
					</tr>
				</table></td>
		</tr>
	</table> --%>
</body>
</html>
