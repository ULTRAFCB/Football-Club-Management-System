<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
</head>

<%
	/********************************************************************
	*	Title: JspEnv v
	*	Description : JSP环境探针
	*	CopyRight:(c)	2010
	*	@version:	1.0
	*********************************************************************/
	long timePageStart = System.currentTimeMillis();
%>
<%
class EnvServlet
{
	public long timeUse=0;
	public Hashtable htParam=new Hashtable();
	private Hashtable htShowMsg=new Hashtable();
	public void setHashtable()
	{
		Properties me=System.getProperties();
		Enumeration em=me.propertyNames();
		while(em.hasMoreElements())
		{
			String strKey=(String)em.nextElement();
			String strValue=me.getProperty(strKey);
			htParam.put(strKey,strValue);
		}
	}	
	public void getHashtable(String strQuery)
	{
		Enumeration em=htParam.keys();
		while(em.hasMoreElements())
		{
			String strKey=(String)em.nextElement();
			String strValue=new String();
			if(strKey.indexOf(strQuery,0)>=0)
			{
				strValue=(String)htParam.get(strKey);
				htShowMsg.put(strKey,strValue);
			}
		}
	}
	public String queryHashtable(String strKey)
	{
		strKey=(String)htParam.get(strKey);
		return strKey;
	}
	public long test_int()
	{
		long timeStart = System.currentTimeMillis();
		int i=0;
		while(i<3000000)i++;
		long timeEnd = System.currentTimeMillis();
		long timeUse=timeEnd-timeStart;
		return timeUse;
	}
	public long test_sqrt()
	{
		long timeStart = System.currentTimeMillis();
		int i=0;
		double db=(double)new Random().nextInt(1000);
		while(i<200000){db=Math.sqrt(db);i++;}
		long timeEnd = System.currentTimeMillis();
		long timeUse=timeEnd-timeStart;
		return timeUse;
	}
}
%>
<%
	EnvServlet env=new EnvServlet();
	env.setHashtable();
	String action=new String(" ");
	String act=new String("action");
	if(request.getQueryString()!=null&&request.getQueryString().indexOf(act,0)>=0)action=request.getParameter(act);
%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[首页]-[欢迎页]</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6">
         
          <tr style="BACKGROUND-COLOR: #f7f8fa">
		    <td align=left colspan=2 height=26>&nbsp;&nbsp;<IMG src="images/conf.gif" border=0>&nbsp;&nbsp;<span class="STYLE3">系统属性</td>
		  </tr>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>PRM程序版本：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;PRM v1.0</TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>服务器名：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%= request.getServerName() %>(<%=request.getRemoteAddr()%>)</TD>
		  </TR>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>服务器操作系统：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=env.queryHashtable("os.name")%> <%=env.queryHashtable("os.version")%> 
              <%=env.queryHashtable("sun.os.patch.level")%></TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>服务器操作系统类型：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%=env.queryHashtable("os.arch")%></TD>
		  </TR>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>当前用户：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=env.queryHashtable("user.name")%></TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>本文件实际路径：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%=request.getRealPath(request.getServletPath())%></TD>
		  </TR>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>JAVA运行环境名称：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=env.queryHashtable("java.runtime.name")%>&nbsp;<%=env.queryHashtable("java.runtime.version")%></TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>JAVA运行环境说明书名称：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%=env.queryHashtable("java.specification.name")%>&nbsp;<%=env.queryHashtable("java.specification.version")%></TD>
		  </TR>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>JAVA虚拟机名称：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=env.queryHashtable("java.vm.name")%>&nbsp;<%=env.queryHashtable("java.vm.version")%></TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>JAVA虚拟机说明书名称：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%=env.queryHashtable("java.vm.specification.name")%>&nbsp;<%=env.queryHashtable("java.vm.specification.version")%></TD>
		  </TR>
 <%
 	float fFreeMemory=(float)Runtime.getRuntime().freeMemory();
	float fTotalMemory=(float)Runtime.getRuntime().totalMemory();
	float fPercent=fFreeMemory/fTotalMemory*100;
 %>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>JAVA虚拟机内存：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=fFreeMemory/1024/1024%>M&nbsp;/&nbsp;&nbsp;<%=fTotalMemory/1024/1024%>M</TD>
		  </TR>    
          
          <tr style="BACKGROUND-COLOR: #f7f8fa">
		    <td align=left colspan=2 height=26>&nbsp;&nbsp;<IMG src="images/conf.gif" border=0>&nbsp;&nbsp;<span class="STYLE3">相关参数</td>
		  </tr>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=25>java.class.path：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=env.queryHashtable("java.class.path")%></TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>java.home：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%=env.queryHashtable("java.home")%></TD>
		  </TR>
          <TR>
		    <TD class="STYLE1" align=right width="28%" bgColor=#ffffff height=32>java.library.path：</TD>
		    <TD class="STYLE1" align=left width="72%" bgColor=#ffffff>&nbsp;<%=env.queryHashtable("java.library.path").replaceAll(env.queryHashtable("path.separator"),env.queryHashtable("path.separator")+"<br>&nbsp;")%></TD>
		  </TR>
		  <TR style="BACKGROUND-COLOR: #f7f8fa">
		    <TD  class="STYLE1" align=right height=25>java.io.tmpdir：</TD>
		    <TD  class="STYLE1" align=left>&nbsp;<%=env.queryHashtable("java.io.tmpdir")%></TD>
		  </TR>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp; </td>
            <td>
            
            
            </td>
          </tr>
        </table>
        </td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
