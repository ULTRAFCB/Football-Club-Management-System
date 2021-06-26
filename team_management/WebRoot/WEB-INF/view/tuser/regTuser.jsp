<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
	<base href="<%=basePath%>">

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 		<script src="plugins/jquery/jquery.min.js"></script>
		<script language="javascript">
			function check(form) {
				if (form.LOGIN_NAME.value == "") {
					alert("请输入用户名！");
					form.LOGIN_NAME.focus();
					return false;
				}
				if (form.PASSWORD.value == "") {
					alert("请输入密码！");
					form.PASSWORD.focus();
					return false;
				}
				if (form.REPASSWORD.value == "") {
					alert("请确认密码！");
					form.REPASSWORD.focus();
					return false;
				}
				if (form.PASSWORD.value != form.REPASSWORD.value) {
					alert("两次输入的密码不一致！");
					form.REPASSWORD.focus();
					return false;
				}
				if (form.EMALL.value == "") {
					alert("请输入E-mail地址！");
					form.EMALL.focus();
					return false;
				}
				//验证E-mail地址
				var regExp = /\w+([-+.']\w+)*@\w+(]-.]\w+)*\.\w+([-.]\w+)*/;
				if (!regExp.test(form.EMALL.value)) {
					alert("您输入的E-mail地址不合法！");
					form.EMALL.focus();
					return false;
				}
			}
			var xmlHttp;

			function checkname() {
				var name = $('#username').val();
				$.ajax({
					// 提交数据的类型 POST GET
					type: "POST",
					// 提交的网址
					url: "tuserCtrl/checkName",
					// 提交的数据
					data: {
						username: name
					},
					// 成功返回之后调用的函数
					success: function(data) {
						var msgText = "";
						if (!data) {
							$('#msg').css("background-color", 'red');
							msgText = '<img src="images/icon_warn.gif" /> 此用户名已被使用！';
						} else{
							$('#msg').css("background-color", 'green');
							msgText = '<img src="images/icon_ok.gif" /> 此用户名可用。';
							flag = true;
						}
						$('#msg').html(msgText);
					},
					// 调用执行后调用的函数
				});
			}

			function setMessage(message) {
				var userMsg = document.getElementById("msg");
				var msgText = "";
				if (message == "true") {
					userMsg.style.color = "red";
					msgText = '<img src="images/icon_warn.gif" /> 此用户名已被使用！';
				} else if (message == "false") {
					userMsg.style.color = "green";
					msgText = '<img src="images/icon_ok.gif" /> 此用户名可用。';
					flag = true;
				}
				userMsg.innerHTML = msgText;
			}
		</script>
	</head>

	<body>

		<table width="902" height="250" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>

				<td width="822" height="352" valign="top" class="wordOrange" background="images/tab_05.gif">
					<table width="100%" height="153" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="5%">
								<div align="center"><img src="images/tb.gif" width="16" height="16" /></div>
							</td>
							<td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[用户管理]-[增加用户]</td>
						</tr>
						<tr>
							<td height="290" colspan="2" valign="top" bgcolor="#FBFBFB">
								<hr align="center" width="87%" class="hr1">
								<form name="form1" method="get" action="tuserCtrl/regTuser" onsubmit="return check(this)">
									<table width="404" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr><input type="hidden" name="rname" value="${param.action}" />
											<td width="66" height="30" align="center">职&nbsp;&nbsp;位</td>
											<td width="338">
												<select name="trightid">
		    		<c:forEach items="${rnameList}" var="a">
		    			<c:if test="${a.rname eq param.action}">
		    			<option  value="${a.trightid}">${a.description}</option></c:if>
		   			</c:forEach>
		   		  </select> * </td>
										</tr>
										<tr>
											<td width="66" height="30" align="center">用 户 名：</td>
											<td width="338"><input id="username" name="username" type="text" size="30" onblur="checkname();">
												<span id="msg"></span></td>
										</tr>

										<tr>
											<td height="30" align="center">密&nbsp;&nbsp;码：</td>
											<td><input name="password" type="password" id="password" size="30"> *
											</td>
										</tr>

										<tr>
											<td height="30" align="center">确认密码：</td>
											<td><input name="repassword" type="password" id="repassword" size="30"> *
											</td>
										</tr>

										<tr>
											<td width="66" height="30" align="center">真实姓名：</td>
											<td width="338"><input name="realname" type="text" size="30"> * </td>
										</tr>
										<tr>
											<td width="66" height="30" align="center">国&nbsp;&nbsp;籍：</td>
											<td width="338"><input name="nationality" type="text" size="30"> * </td>
										</tr>
										<tr>
											<td width="66" height="30" align="center">年&nbsp;&nbsp;龄：</td>
											<td width="338"><input name="age" type="text" size="30"> * </td>
										</tr>
										<tr>
											<td width="66" height="30" align="center">身高：</td>
											<td width="338"><input name="height" type="text" size="30"> * </td>
										</tr>
										<tr>
											<td width="66" height="30" align="center">体重：</td>
											<td width="338"><input name="weight" type="text" size="30"> * </td>
										</tr>
										<tr>
											<td width="66" height="30" align="center">性别：</td>
											<td width="338"><input name="sex" type="radio" size="30" value="男">男
												<input name="sex" type="radio" size="30" value="女">女 *
											</td>
										</tr>

										<tr>
											<td width="66" height="30" align="center">手机号码：</td>
											<td width="338"><input name="tel" type="text" size="30"> * </td>
										</tr>

										<tr>
											<td width="66" height="30" align="center">简历：</td>
											<td width="338"><input name="experience" type="text" size="30"> * </td>
										</tr>

										<tr>
											<td align="center"><input id="submit" type="submit" class="btn_bg" value="注册"></td>
											<td align="center"> <input name="Reset" type="reset" class="btn_bg" id="Reset" value="重置"></td>
											<td align="center"><input name="Button" type="button" class="btn_bg" id="Button" value="返回" onclick="javascript:history.go(-1)"></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</td>
				<td width="42" valign="top" background="images/right_bg.jpg" class="wordOrange">&nbsp;</td>
			</tr>
		</table>
		<table width="902" height="73" border="0" align="center" cellpadding="0" cellspacing="0" background="images/copyright.jpg">
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
	</body>

</html>