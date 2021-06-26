<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>
var highlightcolor = '#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var clickcolor = '#51b2f6';
function changeto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE")
		return;
	while (source.tagName != "TD")
		source = source.parentElement;
	source = source.parentElement;
	cs = source.children;
	//alert(cs.length);
	if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc"
			&& cs[1].style.backgroundColor != clickcolor)
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = highlightcolor;
		}
}

function changeback() {
	if (event.fromElement.contains(event.toElement)
			|| source.contains(event.toElement) || source.id == "nc")
		return
	if (event.toElement != source
			&& cs[1].style.backgroundColor != clickcolor)
		//source.style.backgroundColor=originalcolor
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = "";
		}
}

function clickto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE")
		return;
	while (source.tagName != "TD")
		source = source.parentElement;
	source = source.parentElement;
	cs = source.children;
	//alert(cs.length);
	if (cs[1].style.backgroundColor != clickcolor && source.id != "nc")
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = clickcolor;
		}
	else
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = "";
		}
}
 //  这个方法用来全选   77-85行的作用：通过判断全选键是否选中 
 function  qx(){ 
  var array=[];
  var k=0;
  var zhu=   document.getElementById("zhu");
  var zhu2=   document.getElementById("zhu2");
  var cong=   document.getElementsByName("cong");
  if(zhu.checked==true ||zhu2.checked==true){ //如果全选已选中 就进入遍历 把每一个键都勾选
    for(var i=0;i<cong.length;i++)
       cong[i].checked=true;
  	}
  for(var i=0;i<cong.length;i++){    //再次进行遍历  把已选中的键的 ID值存入 数组array中
  	if(cong[i].checked==true){
  	      array[k]=cong[i].value;
     		 k++;
  	}
  }
 var elm= document.getElementById("elm");  //辞退
  elm.href="commonCtrl/delete?action=summary&tablename=summary&gou="+array;           //159行 里的href 未赋值  所以在此处赋值    问号传参 


 
 }
 
 
 
 
 
function turnpage(){
	
	var turnpage=document.getElementById("turnpage1");
	var page=document.getElementById("pg").value;
	
	turnpage.href="QueryServlet?action=staff&currpage="+page;

	
}




</script>
</head>

<body >
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
                <td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[球队信息管理]-[球队简介管理]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                    <input type="checkbox" id="zhu2" name="checkbox62" value="checkbox" onclick="qx()" />
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                
                <td width="90"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="common/summary/regSummary">添加简介</a></div></td>
                  </tr>
                </table></td>
              
                <td width="82"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="images/del.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="" id="elm">删除简介</a></div></td>
                  </tr>
                </table></td>
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
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" id="zhu" value="checkbox" onclick="qx();" />
            </div></td>
            <td width="3%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="14%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">年份</span></div></td>
            
            <td width="14%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">日期</span></div></td>
            <td width="16%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">标题</span></div></td>
            <td width="36%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内容</span></div></td>
			 <td width="14%" height="22" background="images/bg1.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>          
          <!--   <c:if test="${trightnam1e=='boss'}"> -->
          	<!--</c:if>-->
          </tr>
       
    <c:forEach  items="${pageModel.list}" var="b" varStatus="status">
  
   
 
          <tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="cong" value="${b.summaryid}" onclick="qx();"/>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center">${status.count+(pageModel.currPage-1)*10}</div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${b.years}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${b.days}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${b.title}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${b.content}</span></div></td>
 			<td height="20" bgcolor="#FFFFFF"> <div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" /><a href="common/summary/edtSummary?summaryID=${b.summaryid}&years=${b.years}&days=${b.days}&title=${b.title}&content=${b.content}">修改信息</a></span></div></td>
          </tr>
          </c:forEach>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有${pageModel.totalRecords}  条记录，当前第${pageModel.currPage} /${pageModel.totalPage}  页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><a href="tuserCtrl/queryTuser?action=coach&currpage=1"><img src="images/first.gif" width="37" height="15" /></a></td>
                  <td width="45"><a href="tuserCtrl/queryTuser?action=coach&currpage=${pageModel.previousPage}"><img src="images/back.gif" width="43" height="15" /></a></td>
                  <td width="45"><a href="tuserCtrl/queryTuser?action=coach&currpage=${pageModel.nextPage}"><img src="images/next.gif" width="43" height="15" /></a></td>
                  <td width="40"><a href="QueryServlet?action=coach&currpage=${pageModel.totalPage}"><img src="images/last.gif" width="37" height="15" /></a></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <select name="textfield" id="pg" onchange="turnpage()">
												<c:forEach begin="1" end="${pageModel.totalPage}"
													varStatus="vs">
													<c:choose>
														<c:when test="${pageModel.currPage ne vs.count}">
															<option value="${vs.count}">
																${vs.count}
															</option>
														</c:when>
														<c:otherwise>
															<option value="${vs.count}" selected="selected">
																${vs.count}
															</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select> 
                    页 </span></div></td>
                  <td width="40"><a href="tuserCtrl/queryTuser?action=coach&currpage=1" id="turnpage1"><img src="images/go.gif" width="37" height="15"></a></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<c:if test="${not empty message}">
 <script>alert("${message}");</script></c:if>
</body>
</html>
 