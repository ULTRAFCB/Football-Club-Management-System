<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<title>足球俱乐部球员信息管理系统</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/layer/layer.js"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #016aa9;
	overflow: hidden;
	background: url('images/login_01.jpg') no-repeat;
	background-size: cover;
}

.STYLE1 {
	color: #000000;
	font-size: 12px;
}

.bg {
	width: 100%;
	height: 500px;
	margin-top: 200px;
	padding-top: 100px;
	background: url('images/logo161.png') no-repeat center top;
	ba
}
</style>
<script type="text/javascript">
	//防止嵌套
$(function(){
	$("#username").focus();
	/* $('.bg table').css({
		'top' : $(window).height() * 235/965 + 'px',
		'left' : $(window).width() * 850/1920 + 'px'
	}) */
})

//if(window.top!=window.self){
//	top.location.href='<%=path%>/supervisory/forward/gotoLogin';
//}
//if('<%=session.getAttribute("userInfo")%>' != 'null'){
//	window.location.href='<%=path%>/supervisory/forward/gotoMainFrame';
//}
//登录方法
var ifLogining = false;
function toLogin(){ 
// 	if($("#username").val()==null||$("#username").val()==""){
// 		layer.msg("请输入您的账号!", {icon : 2, time : 1500});
// 		$("#username").focus();
// 		return;
// 	}
// 	if($("#password").val()==null||$("#password").val()==""){
// 		layer.msg("请输入密码!", {icon : 2, time : 1500});
// 		$("#password").focus();
// 		return;
// 	}
	if(ifLogining){
		return;
	}
	var name = $("#username").val();
	var pwd = $("#password").val();
	ifLogining = true;
	var lloading = layer.msg("正在登陆...", {icon : 16, shade: false, time : 0});
	$.ajax({ 
		type:'POST',
		url : '<%=path%>/loginCtrl/login',
		data: {username:name,password:pwd}, 
		success : function(result) {
			ifLogining = false;
			layer.close(lloading);
			if(result =="true"){   
				
				window.location.href='<%=path%>/common/login/index';
	        }else if(result=="stop"){
	        layer.msg("您没有登录权限，请与管理员联系",{icon : 5, time : 1500});
	      }
	        else {
	        	layer.msg("账号密码错误",{icon : 4, time : 1500});
	        }
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			ifLogining = false;
// 			layer.msg("亲!您的网络不给力哦~ ", {icon : 5, time : 1500});
		}
	});
}

//Enter键登陆
function toSubmit(){

	if(event.keyCode==13){
		toLogin();
	}
}
	
</script>


</head>
<body onkeydown="toSubmit();">
	<div class="bg" style="">
		<table border="0" cellpadding="0" cellspacing="0"
			style="margin: auto;">
			<tr>
				<td width="20%" height="25">&nbsp;</td>
				<td width="20%" height="25"><span class="STYLE1">用户</span></td>
				<td width="60%" height="25"><input type="text" id="username"
					name="username"
					style="width: 105px; height: 17px; background-color: #292929; border: solid 1px #7dbad7; font-size: 12px; color: #6cd0ff">
				</td>
			</tr>
			<tr>
				<td width="20%" height="25">&nbsp;</td>
				<td width="20%" height="25"><span class="STYLE1">密码</span></td>
				<td width="60%" height="25"><input type="password"
					id="password" name="password"
					style="width: 105px; height: 17px; background-color: #292929; border: solid 1px #7dbad7; font-size: 12px; color: #6cd0ff">
				</td>
			</tr>
			<tr>
				<td width="20%" height="25">&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="image" src="images/dl.gif" width="49"
					height="18" border="0" onclick="toLogin()"
					style="margin-left: 100px;"></td>
			</tr>
		</table>
	</div>
	<!-- <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>  <input type="hidden" name="action" value="login"/>   
    <td><table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="235" background="images/login_03.png">&nbsp;</td>
      </tr>
      <tr>
        <td height="53"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="394" height="53" background="images/login_05.gif">&nbsp;</td>
            <td width="206" background="images/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="16%" height="25"><div align="right"><span class="STYLE1">用户</span></div></td>
                <td width="57%" height="25"><div align="center">
                  <input type="text" id="username" name="username" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                </div></td>
                <td width="27%" height="25">&nbsp;</td>
              </tr>
       
              <tr>
                <td height="25"><div align="right"><span class="STYLE1">密码</span></div></td>
                <td height="25"><div align="center">
                  <input type="password" id="password" name="password" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                </div></td>
                <td height="25"><div align="left"><input type="image" src="images/dl.gif" width="49" height="18" border="0" onclick="toLogin()"> </div></td>
                <div id="error"></div>
              </tr>
            </table></td>
            <td width="362" background="images/login_07.gif"  >&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="213" background="images/login_08.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table> -->
	<!--<c:if test="${not empty righterror}">
 <script>alert("${righterror}");</script></c:if>-->
</body>
</html>