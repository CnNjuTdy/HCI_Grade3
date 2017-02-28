<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="entity.RSI" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
	List<RSI> list1 = (List<RSI>)request.getAttribute("list1");	
	List<RSI> list2 = (List<RSI>)request.getAttribute("list2");	
	List<RSI> list3 = (List<RSI>)request.getAttribute("list3");	
	ArrayList<String> result = (ArrayList<String>)request.getAttribute("result");
    DecimalFormat df = new DecimalFormat("0.00");
%>

<html>
	<meta http-equiv="Content-Type" content="text/html" charset=utf-8">
	<title>RSI</title>
	<head>
	<style type="text/css">
		h2 {color: red; display : inline}
    </style>
	</head>
<body>

<div id="rsi" style="height:400px;"></div>
<div style="positon:relative;margin-left:15%">
	<h2>股票分析：</h2>
	<%for(int i=0;i<result.size();i++){
    %>
        <h3><%=result.get(i)%></h3>
    <%
} %>
</div>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
      <script type="text/javascript">
      var dates = new Array();
	  var rsi1 = new Array(); 
	  var rsi2 = new Array(); 
	  var rsi3 = new Array(); 
	 <%int num=list1.size();
	 for(int i=0;i<num;i++){
	   %>
	   dates[<%=i%>]="<%=list1.get(i).getDate()%>";
	   rsi1[<%=i%>]="<%=list1.get(i).getRSI()%>";
	   rsi2[<%=i%>]="<%=list2.get(i).getRSI()%>";
	   rsi3[<%=i%>]="<%=list3.get(i).getRSI()%>";
	   <%
	 }
	 %>

        require.config({
            paths: {
                echarts: 'js/echarts'
            }
        });
        // 使用
        require
        (
            [
                'echarts',
                'echarts/chart/line',
                'echarts/chart/bar'// 使用柱状图就加载bar模块，按需加载

            ],
            function (ec) 
            {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('rsi')); 
                var option = {
                		title : {
                	        text: 'RSI',
              
                	    },
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType: {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    legend: {
                	        data:['RSI_6','RSI_9','RSI_12']
                	    },
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : dates
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value',
                	            axisLabel : {
                	                formatter: '{value}'
                	            }
                	        }
                	    ],
                	    series : [

                	        {
                	            name:'RSI_6',
                	            type:'line',
                	            data:rsi1,
                	        },
                	        {
                	            name:'RSI_9',
                	            type:'line',
                	            data:rsi2,
                	        },
                	        {
                	            name:'RSI_12',
                	            type:'line',
                	            data:rsi3,
                	        }
                	    ]
                }; 
                myChart.setOption(option); 
            }
        );
    </script>
	
</body>
</html>