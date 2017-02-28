<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="entity.MACD" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
	List<MACD> list = (List<MACD>)request.getAttribute("list");	
	ArrayList<String> result=(ArrayList<String>)request.getAttribute("result");
    DecimalFormat df = new DecimalFormat("0.00");
%>

<html>
	<meta http-equiv="Content-Type" content="text/html" charset=utf-8">
	<title>MACD</title>
<head>
	<style type="text/css">
	h2 {color: red; display : inline}
</style>
</head>
<body>
<div id="macd" style="height:400px;"></div>
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
	  var macd = new Array(); 
	  var dif = new Array();
	  var dea = new Array();
	 <%int num=list.size();
	 System.out.print(list.get(0).getMACD());
	 for(int i=0;i<num;i++){
	   %>
	   dates[<%=i%>]="<%=list.get(i).getDate()%>";
	   macd[<%=i%>]="<%=df.format(list.get(i).getMACD())%>";
	   dif[<%=i%>]="<%=df.format(list.get(i).getDIF())%>";
	   dea[<%=i%>]="<%=df.format(list.get(i).getDEA())%>";
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
                var myChart = ec.init(document.getElementById('macd')); 
                var option = {
                		title : {
                	        text: 'MACD',
              
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
                	        data:['MACD','DIF','DEA']
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
                	            name:'MACD',
                	            type:'bar',
                	            data:macd,
                	        },
                	        {
                	            name:'DIF',
                	            type:'line',
                	            data:dif,
                	        },
                	        {
                	            name:'DEA',
                	            type:'line',
                	            data:dea,
                	        }
                	    ]
                }; 
                myChart.setOption(option); 
            }
        );
    </script>
	
</body>
</html>