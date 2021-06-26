<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="plugins/jquery-time/js/jquery.js"></script>
<script type="text/javascript" src="plugins/eCharts/js/echarts.min.js"></script>
</head>
<body>

    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width:1650px;height:700px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        // 指定图表的配置项和数据
        var id=${param.tuserid};
        $(function(){
     $.ajax({ 
		type:'POST',
		data: {tuserid:id}, 
		url : '<%=path%>/dataCtrl/showData',
	   async: false,
		success : function(data) {
		JSON.stringify(data);
		
		
		  myChart.setOption({
   
     title : {
        text: '球员数据统计',
        subtext: '近七场比赛'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['上场时间','进球数','助攻数','传球数','抢断数','解围数','犯规数']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['第一场','第二场','第三场','第四场','第五场','第六场','第七场']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'上场时间',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
			 data:data.minutes
        },
        {
            name:'进球数',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
             data:data.goals
        },
        {
            name:'助攻数',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            data:data.assists
        },
          {
            name:'传球数',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
             data:data.pass
        },  
        {
            name:'抢断数',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
              data:data.tackles
        },
          {
            name:'解围数',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            data:data.clear
        },
          {
            name:'犯规数',
            type:'line',
            smooth:true,
             label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            data:data.fouls
        }
        
    ]

}  
);
		
		}
	});
   
        });
      
    </script>
	</body>
</html>
