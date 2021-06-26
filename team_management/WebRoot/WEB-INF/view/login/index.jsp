<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<frameset rows="98,*,6" frameborder="no" border="0" framespacing="0">
  <frame src="<%=path%>/common/login/top" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frame src="<%=path%>/common/login/main" name="mainFrame" id="mainFrame" />
  <frame src="<%=path%>/common/login/down" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
<body>
</body>
</noframes></html>


