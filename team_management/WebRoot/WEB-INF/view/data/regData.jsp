<%@ page language="java"  import="java.util.* " pageEncoding="utf-8"%>
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
<script language="javascript">

	function check(form){
		if(form.LOGIN_NAME.value==""){
			alert("请输入用户名！");form.LOGIN_NAME.focus();return false;
		}
		if(form.PASSWORD.value==""){
			alert("请输入密码！");form.PASSWORD.focus();return false;
		}
		if(form.REPASSWORD.value==""){
			alert("请确认密码！");form.REPASSWORD.focus();return false;
		}
		if(form.PASSWORD.value!=form.REPASSWORD.value){
			alert("两次输入的密码不一致！");form.REPASSWORD.focus();return false;
		}
		if(form.EMALL.value==""){
			alert("请输入E-mail地址！");form.EMALL.focus();return false;
		}
		
		//验证E-mail地址
		var regExp=/\w+([-+.']\w+)*@\w+(]-.]\w+)*\.\w+([-.]\w+)*/;
		if(!regExp.test(form.EMALL.value)){
			alert("您输入的E-mail地址不合法！");form.EMALL.focus();return false;
		}		
	}
	
	

	</script>
</head>
<body>


<table width="902" height="250" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    
    <td width="822" height="352" valign="top" class="wordOrange"><table width="100%" height="153" border="0" cellpadding="0" cellspacing="0">
         <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[球队日常管理]-[数据统计管理]-[增加数据]</td>
        </tr>
        <tr>
          <td height="290" colspan="2" valign="top" bgcolor="#FBFBFB">
<hr align="center" width="87%" class="hr1">		 
		   <form name="form1" method="get" action="dataCtrl/regData"  onsubmit="return check(this)">
              <table width="404" border="0" align="center" cellpadding="0" cellspacing="0">
              	 
               	  <tr>
                  <td width="66" height="30" align="center">球员姓名与位置</td>
                  <td width="338">
                  <select name="tuserID" >
		    		<c:forEach items="${playerList}" var="a">
		    			<option  value="${a.tuserid}">${a.realname}||${a.description}</option>
		   			</c:forEach>
		   		  </select>
                    * </td>
                </tr>
		    			
		   
		   	
        
               <tr>
                  <td width="120" height="30" align="center">上场时间：</td>
                  <td width="338"><input name="minutes" type="text" size="30"  >
                     </td>
                </tr>
           
                   <tr>
                  <td width="120" height="30" align="center">进球数：</td>
                  <td width="338"><input name="goals" type="text"  size="50" >
                  					
                     </td>
                </tr>
                    <tr>
                  <td width="120" height="30" align="center">助攻数：</td>
                  <td width="338"><input name="assists" type="text"  size="50" >
                  					
                     </td>
                </tr>
                    <tr>
                  <td width="120" height="30" align="center">传球数：</td>
                  <td width="338"><input name="pass" type="text"  size="50" >
                  					
                     </td>
                </tr>
                    <tr>
                  <td width="120" height="30" align="center">抢断数：</td>
                  <td width="338"><input name="tackles" type="text"  size="50" >
                  					
                     </td>
                </tr>
                    <tr>
                  <td width="120" height="30" align="center">解围数：</td>
                  <td width="338"><input name="clear" type="text"  size="50" >
                  					
                     </td>
                </tr>
                    <tr>
                  <td width="120" height="30" align="center">犯规数：</td>
                  <td width="338"><input name="fouls" type="text"  size="50" >
                  					
                     </td>
                </tr>
              
                
                
                
             
                
               
                
                  <tr>
                  <td align="center"><input   id="submit" type="submit"  class="btn_bg" value="添加"></td>
                  
                    <td align="center"><input name="Button" type="button" class="btn_bg" id="Button" value="返回" onclick="javascript:history.go(-1)"></td>
                </tr>
              
              </table>
          </form></td>
        </tr>
    </table></td>
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
