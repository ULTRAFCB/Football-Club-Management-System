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
		}zz
		
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
    
    <td width="822" height="352" valign="top" class="wordOrange" background="images/tab_05.gif"><table width="100%" height="153" border="0" cellpadding="0" cellspacing="0">
         <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[权限信息管理]-[修改权限]</td>
        </tr>
        <tr>
          <td height="290" colspan="2" valign="top" bgcolor="#FBFBFB">
<hr align="center" width="87%" class="hr1">		 
		  <form name="form1" method="get" action="tuserCtrl/edtTright"  onsubmit="return check(this)">
              <table width="404" border="0" align="center" cellpadding="0" cellspacing="0">
              	 
               	  <tr>
                  <td width="66" height="30" align="center">上级权限名</td>
                  <td width="338"><input name="trightID" type="hidden" value="<%=request.getParameter("trightid")%>"> 
                  <select name="pid" >
                  		<option  value="${param.trightid}">${param.zdp}</option>
		    		<c:forEach items="${rnameList}" var="a">
		    			<c:if test="${a.trightid ne param.trightid }">
		    			<c:if test="${a.trightid gt 0}">
		    			<option  value="${a.trightid}">${a.description}</option>
		    			</c:if></c:if>
		   			</c:forEach>
		   		  </select>
                    * </td>
                </tr>
		    			
		   
		   	
        
               <tr>
                  <td width="120" height="30" align="center">权限组：</td>
                  <td width="338"><input name="rname" type="text" size="30" readonly="readonly" value="<%=request.getParameter("action")%>" >
                     
                     </td>
                </tr>
                
                  <tr>
                  <td width="120" height="30" align="center">权限名：</td>
                  <td width="338"><input name="description" type="text" size="30" value="<%=request.getParameter("description")%>" >
                     
                     </td>
                </tr>
           
               
                
                
                
             
                
               
                
                  <tr>
                  <td align="center"><input   id="submit" type="submit"  class="btn_bg" value="修改"></td>
                  
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
