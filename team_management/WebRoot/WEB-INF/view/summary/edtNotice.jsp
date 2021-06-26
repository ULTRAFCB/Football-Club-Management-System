<%@ page language="java"  import="java.util.* " pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
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
    
    <td width="822" height="352" valign="top" class="wordOrange" background="images/tab_05.gif"><table width="100%" height="153" border="0" cellpadding="0" cellspacing="0">
         <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[球队信息管理]-[添加公告]</td>
        </tr>
        <tr>
          <td height="290" colspan="2" valign="top" bgcolor="#FBFBFB">
<hr align="center" width="87%" class="hr1">		 
		  <form name="form1" method="get" action="summaryCtrl/edtNotice"  onsubmit="return check(this)">
              <table width="404" border="0" align="center" cellpadding="0" cellspacing="0">
              	 
                
		    		
		    			
		   
		   	
        
                 <c:forEach items="${noticeList}" var="b">
              
                    <tr>
                  <td width="66" height="30" align="center">内&nbsp;&nbsp;容：</td>
                  <td width="338">
              <!--  <input name="content" type="text" size="50" value="${b.content}"/> -->   
                  <textarea rows="10" cols="30" name="content" >${b.content}</textarea>
                  <input name="noticeID" type="hidden"  value="${b.noticeid}"/>
                  
                    * </td>
                </tr>
                </c:forEach>
               <tr>
                  <td ><input   id="submit" type="submit"  class="btn_bg" value="确认修改"></td>
                  
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
<c:if test="${not empty message}">
 <script>alert("${message}");</script></c:if>
</body>
</html>
